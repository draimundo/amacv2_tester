#include <iostream>

#include "SPICom.h"

int main()
{
  SPICom spi("/dev/spidev1.0");

  std::cout << "device id = 0x" << std::hex << spi.read_reg(0xD0) << std::dec << std::endl;

  spi.write_reg(0x74, 0x23);
  std::cout << "conf = 0x" << std::hex << spi.read_reg(0xF4) << std::dec << std::endl;
  //        0x74, 0x23
//        0xF4, 0x00
  //0xFA, 0x00, 0x00, 0x00
  uint8_t data[3];
  spi.read_reg(0xFA,data,3);
  unsigned int temp=(data[2]<<16)|(data[1]<<8)|(data[0]);
  std::cout << "0x" << std::hex << temp << std::dec << std::endl;

  return 0;
}
