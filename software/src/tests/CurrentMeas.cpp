#include "AMACTB.h"
#include <unistd.h>
#include <iostream>
#include <iomanip>
#include <vector>

int main(){
  float AM_VDD_V, AM_VDD_A, AM_VDDLR_A, AM_VDDLR_V, AM_VDCDC_A, AM_VDCDC_V, AM_VDD_HI_A, AM_VDD_HI_V;
  float AVCC_V, AVDD5_V, VCC5_V, VDD2V5_V, AVEE_V, VEE5_V, VDD1V2_V;
  const uint16_t res = 0xFFFF;
  std::cout << "Current measurement program" << std::endl;
  AMACTB TB;
  
  TB.powerOff();
  TB.powerAMACOff();
	std::cout << "Power off" << std::endl;
	usleep(1E6); // 1s wait for a clear power up
	TB.powerOn();
  TB.powerAMACOn();
  //TB.setIO(TB.MPM_MUX_EN, true);
	std::cout << "Power on" << std::endl;
  while(true){
    
    // usleep(100E3);
    // TB.selMUXChannel(AVCC);
    // int16_t var = TB.ADC0.setAndReadChan(5,2).result;
    // std::cout << "ADC05 counts: " << (signed)var << std::endl;
    // std::cout << "ADC05 counts: " << -((float)var)/res *10. << std::endl;
    
    AM_VDD_A =  -((float)((int16_t)TB.ADC0.setAndReadChan(7,2).result))/res *10.; //may not work, not sure of what chan 7 is
    usleep(100E3);
    
    AM_VDD_V = ((float)TB.ADC0.setAndReadChan(6).result)/res * 5.;
    usleep(100E3);
    
    AM_VDDLR_A = -((float)((int16_t)TB.ADC0.setAndReadChan(5,2).result))/res *10.;
    usleep(100E3);
    
    
    AM_VDDLR_V = ((float)TB.ADC0.setAndReadChan(4).result)/res * 5.;
    usleep(100E3);
    
    AM_VDCDC_A = -((float)((int16_t)TB.ADC0.setAndReadChan(3,2).result))/res *10.;
    usleep(100E3);
    
    AM_VDCDC_V = ((float)TB.ADC0.setAndReadChan(2).result)/res * 5.;
    usleep(100E3);
    
    AM_VDD_HI_A = -((float)((int16_t)TB.ADC0.setAndReadChan(1,2).result))/res *10.;
    usleep(100E3);
    
    AM_VDD_HI_V = ((float)TB.ADC0.setAndReadChan(0).result)/res * 5.;
    usleep(100E3);
    
    
    // TB.selMUXChannel(AVCC);
    // AVCC_V = ((float)TB.ADC2.setAndReadChan(3,4).result)/res * 10.;
    // usleep(100E3);
    
    // TB.selMUXChannel(AVDD5);
    // AVDD5_V = ((float)TB.ADC2.setAndReadChan(3,4).result)/res * 10.;
    // usleep(100E3);
    
    // TB.selMUXChannel(VCC5);
    // VCC5_V = ((float)TB.ADC2.setAndReadChan(3,4).result)/res * 10.;
    // usleep(100E3);
    
    // TB.selMUXChannel(VDD2V5);
    // VDD2V5_V = ((float)TB.ADC2.setAndReadChan(3).result)/res * 5.;
    // usleep(100E3);
    
    // TB.selMUXChannel(AVEE);
    // AVEE_V = ((float)TB.ADC2.setAndReadChan(3).result)/res * 5.;
    // usleep(100E3);
    
    // TB.selMUXChannel(VEE5);
    // VEE5_V = ((float)TB.ADC2.setAndReadChan(3).result)/res * 5.;
    // usleep(100E3);
    
    // TB.selMUXChannel(VDD1V2);
    // VDD1V2_V = ((float)TB.ADC2.setAndReadChan(3).result)/res * 5.;
    // usleep(100E3);
    
    
    std::cout << std::fixed << std::setprecision(10) << "AM_VDDLR voltage: " << AM_VDDLR_V << "V" << std::endl;
    std::cout << std::fixed << std::setprecision(10) << "AM_VDDLR current: " << AM_VDDLR_A << "A\n" << std::endl;
    
    std::cout << std::fixed << std::setprecision(10) << "AM_VDCDC voltage: " << AM_VDCDC_V << "V" << std::endl;
    std::cout << std::fixed << std::setprecision(10) << "AM_VDCDC current: " << AM_VDCDC_A << "A\n" << std::endl;
    
    std::cout << std::fixed << std::setprecision(10) << "AM_VDD_HI voltage: " << AM_VDD_HI_V  << "V" << std::endl;
    std::cout << std::fixed << std::setprecision(10) << "AM_VDD_HI current: " << AM_VDD_HI_A << "A\n" << std::endl;
    
    std::cout << std::fixed << std::setprecision(10) << "AM_VDD voltage: " << AM_VDD_V  << "V" << std::endl;
    std::cout << std::fixed << std::setprecision(10) << "AM_VDD current: " << AM_VDD_A  << "A\n" << std::endl;
    
    // std::cout << "AVCC voltage: " << AVCC_V  << "V" << std::endl;
    //std::cout << "AVDD5 voltage: " << AVDD5_V  << "V" << std::endl;
    // std::cout << "VCC5 voltage: " << VCC5_V  << "V" << std::endl;
    // std::cout << "VDD2V5 voltage: " << VDD2V5_V  << "V" << std::endl;
    // std::cout << "AVEE voltage: " << AVEE_V  << "V" << std::endl;
    // std::cout << "VEE5 voltage: " << VEE5_V  << "V" << std::endl;
    // std::cout << "VDD1V2 voltage: " << VDD1V2_V  << "V\n" << std::endl;
  }
}  