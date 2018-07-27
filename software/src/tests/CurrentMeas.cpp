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
  TB.setIO(TB.MPM_MUX_EN, true);
	std::cout << "Power on" << std::endl;
  while(true){
    
    // usleep(100E3);
    // TB.selMUXChannel(AVCC);
    // int16_t var = TB.ADC0.setAndReadChan(5,2).result;
    // std::cout << "ADC05 counts: " << (signed)var << std::endl;
    // std::cout << "ADC05 counts: " << -((float)var)/res *10. << std::endl;
    
    // AM_VDD_A =  -((float)((int16_t)TB.ADC0.setAndReadChan(7,2).result))/res *10.; //may not work, not sure of what chan 7 is
    // usleep(100E3);
    
    // AM_VDD_V = ((float)TB.ADC0.setAndReadChan(6).result)/res * 5.;
    // usleep(100E3);
    
    // AM_VDDLR_A = -((float)((int16_t)TB.ADC0.setAndReadChan(5,2).result))/res *10.;
    // usleep(100E3);
    
    
    // AM_VDDLR_V = ((float)TB.ADC0.setAndReadChan(4).result)/res * 5.;
    // usleep(100E3);
    
    // AM_VDCDC_A = -((float)((int16_t)TB.ADC0.setAndReadChan(3,2).result))/res *10.;
    // usleep(100E3);
    
    // AM_VDCDC_V = ((float)TB.ADC0.setAndReadChan(2).result)/res * 5.;
    // usleep(100E3);
    
    // AM_VDD_HI_A = -((float)((int16_t)TB.ADC0.setAndReadChan(1,2).result))/res *10.;
    // usleep(100E3);
    
    // AM_VDD_HI_V = ((float)TB.ADC0.setAndReadChan(0).result)/res * 5.;
    // usleep(100E3);
    
    
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
    
    
    std::cout << std::fixed << std::setprecision(10) << "AM_VDDLR voltage: " << TB.getADC(TB.AM_VDDLR_V) << "V" << std::endl;
    std::cout << std::fixed << std::setprecision(10) << "AM_VDDLR current: " << TB.getADC(TB.AM_VDDLR_A) << "A\n" << std::endl;
    
    std::cout << std::fixed << std::setprecision(10) << "AM_VDCDC voltage: " << TB.getADC(TB.AM_VDCDC_V) << "V" << std::endl;
    std::cout << std::fixed << std::setprecision(10) << "AM_VDCDC current: " << TB.getADC(TB.AM_VDCDC_A) << "A\n" << std::endl;
    
    std::cout << std::fixed << std::setprecision(10) << "AM_VDD_HI voltage: " << TB.getADC(TB.AM_VDD_HI_V)  << "V" << std::endl;
    std::cout << std::fixed << std::setprecision(10) << "AM_VDD_HI current: " << TB.getADC(TB.AM_VDD_HI_A) << "A\n" << std::endl;
    
    std::cout << std::fixed << std::setprecision(10) << "AM_VDD voltage: " << TB.getADC(TB.AM_VDD_V)  << "V\n" << std::endl;
    
    std::cout << std::fixed << std::setprecision(10) <<"AVCC voltage: " << TB.getADC(TB.AVCC_V)  << "V" << std::endl;
    std::cout << std::fixed << std::setprecision(10) <<"AVCC current: " << TB.getADC(TB.AVCC_A)  << "A\n" << std::endl;
    std::cout << std::fixed << std::setprecision(10) <<"VCC5 voltage: " << TB.getADC(TB.VCC5_V)  << "V" << std::endl;
    std::cout << std::fixed << std::setprecision(10) <<"VCC5 current: " << TB.getADC(TB.VCC5_A)  << "A\n" << std::endl;
    std::cout << std::fixed << std::setprecision(10) <<"AVDD5 voltage: " << TB.getADC(TB.AVDD5_V)  << "V" << std::endl;
    std::cout << std::fixed << std::setprecision(10) <<"VDD2V5 voltage: " << TB.getADC(TB.VDD2V5_V)  << "V" << std::endl;
    std::cout << std::fixed << std::setprecision(10) <<"AVEE voltage: " << TB.getADC(TB.AVEE_V)  << "V" << std::endl;
    std::cout << std::fixed << std::setprecision(10) <<"VEE5 voltage: " << TB.getADC(TB.VEE5_V)  << "V" << std::endl;
    std::cout << std::fixed << std::setprecision(10) <<"VDD1V2 voltage: " << TB.getADC(TB.VDD1V2_V)  << "V\n\n\n" << std::endl;
  }
}  