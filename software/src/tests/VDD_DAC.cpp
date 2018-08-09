#include "AMACTB.h"
#include "AMAC.h"
#include "AMACTest.h"

#include <unistd.h>
#include <iostream>
#include <iomanip>
#include <vector>

int main(){
  std::shared_ptr<AMACTB> TB=std::make_shared<AMACTB>();
  
  TB->powerOn();
  TB->powerAMACOn();
  usleep(1E6); // 1s wait for a clean power up
  std::cout << "Power ON" << std::endl;
  std::cout << "Measured VDDLR[V] :" << TB->getADC(TB->AM_VDDLR_V) << std::endl;
  std::cout << "Measured VDCDC[V] :" << TB->getADC(TB->AM_VDCDC_V) << std::endl;
  for(int i = 0; i < 27; ++i){
    float set_voltage = 0.2+i*50E-3; //range from 0.2V to 1.55V
    TB->setDAC(TB->VDCDC_ADJ, set_voltage);
    TB->setDAC(TB->VDDRL_ADJ, set_voltage);
    // if(i == 0){
      // TB->setDAC(TB->VDCDC_ADJ, set_voltage);
      // TB->setDAC(TB->VDDRL_ADJ, set_voltage);
      // TB->getADC(TB->AM_VDDLR_V);
      // TB->getADC(TB->AM_VDCDC_V);
    // }
    std::cout << "Set voltage[V] :" << set_voltage << std::endl;
    usleep(1E6);
    std::cout << "Measured VDDLR[V] :" << TB->getADC(TB->AM_VDDLR_V) << std::endl;
    std::cout << "Measured VDCDC[V] :" << TB->getADC(TB->AM_VDCDC_V) << std::endl;
    
    
  }
  TB->powerOff();
  return 0;
}