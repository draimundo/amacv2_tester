#include <iostream>
#include <iomanip>
#include <thread>
#include <chrono>

#include "SPICom.h"

int main()
{
  SPICom spi("/dev/spidev1.0");

  //
  // Print device ID
  spi.write_reg(0x60, 0xB6);
  std::this_thread::sleep_for(std::chrono::milliseconds(500));
  
  std::cout << "device id = 0x" << std::hex << spi.read_reg(0xD0) << std::dec << std::endl;

  //
  // Dump all registers
  std::cout << std::endl << "all registers" << std::endl;
  std::cout << std::hex;
  for(uint i=0;i<8;i++)
    {
      uint8_t reg=0x80+(i<<4);
      std::cout << "0x" << std::setw(2) << std::setfill('0') << (uint)reg << ":";

      uint8_t regdata[16];
      spi.read_reg(reg,regdata,16);
      for(uint j=0;j<16;j++)
	std::cout << " " << std::setw(2) << std::setfill('0') << (uint)regdata[j];
      
      std::cout << std::endl;
    }
  std::cout << std::dec;

  //
  // Read the calibration
  std::cout << std::endl << "calibration" << std::endl;
  uint8_t calibdata[6];
  spi.read_reg(0x88,calibdata,6);
  for(uint i=0; i<6; i++)
    std::cout << std::hex << (uint)calibdata[i] << std::dec << std::endl;
  ushort dig_T1=(calibdata[1]<<8)|calibdata[0];
  short dig_T2=(calibdata[3]<<8)|calibdata[2];
  short dig_T3=(calibdata[5]<<8)|calibdata[4];
  std::cout << "dig_T1 = 0x" << std::hex << std::setw(4) << std::setfill('0') << dig_T1 << std::dec << std::endl;
  std::cout << "dig_T2 = 0x" << std::hex << std::setw(4) << std::setfill('0') << dig_T2 << std::dec << std::endl;
  std::cout << "dig_T3 = 0x" << std::hex << std::setw(4) << std::setfill('0') << dig_T3 << std::dec << std::endl;


  //
  // Start reading
  std::cout << std::endl << "data" << std::endl;
  spi.write_reg(0x74, 0x23);
  std::this_thread::sleep_for(std::chrono::milliseconds(500));

  // The sampling loop
  uint8_t data[3];
  for(uint i=0;i<1000;i++)
    {
      spi.read_reg(0xFA,data,3);
      signed int adc_T=(data[0]<<16)|(data[1]<<8)|(data[2]);
      adc_T>>=4;

      int t_fine;
      int var1, var2, T;
      var1 = (( ((adc_T>>3) - (dig_T1<<1)) ) * (dig_T2)) >> 11;
      var2 = (((((adc_T>>4) - (dig_T1)) * ((adc_T>>4) - (dig_T1))) >> 12) * (dig_T3)) >> 14;
      t_fine = var1 + var2;
      T = (t_fine * 5 + 128) >> 8;

      std::cout << T/100. << std::endl;
      std::this_thread::sleep_for(std::chrono::seconds(1));
    }

  return 0;
}
