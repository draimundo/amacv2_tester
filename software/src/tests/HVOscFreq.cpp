#include "AMACTB.h"
#include "AMAC.h"
#include "AMACTest.h"

#include <unistd.h>
#include <iostream>
#include <iomanip>
#include <vector>

int main()
{
  std::shared_ptr<AMACTB> TB=std::make_shared<AMACTB>();
  AMACTest test("AMACREF1",TB);

  // Power on
  TB->powerOn();
  usleep(1E6); // 1s wait for a clean power up
  std::cout << "Power ON" << std::endl;

  // Configure I/O pads
  TB->setIDPads(0x1F);
  TB->setIO(TB->ResetB, true);

  // Power on AMAC
  TB->powerAMACOn();
  std::cout << "AMAC ON" << std::endl;
  usleep(1E6);

  // Set ID
  TB->END.setid(EndeavourCom::REFMODE::IDPads, 0x1F);
  std::cout << "SETID" << std::endl;
  usleep(1E6);

  TB->setDAC(TB->VDDHI_ADJ, 3.3);

  TB->setDAC(TB->RgOsc_Vref, 0.3);
  TB->FRQ.reset("CLKOUT");
  TB->FRQ.start("CLKOUT");
  usleep(1E6); //1s wait for conv and display
  std::cout << "Measured CLKOUT frequency: " << TB->FRQ.get_frq("CLKOUT") << "Hz" << std::endl;
  
  TB->setDAC(TB->HVOsc_Vref, 0.15);
  
  TB->FRQ.set_ts_cnt("HVOSC0", 500E6);
  TB->FRQ.reset("HVOSC0");
  TB->FRQ.start("HVOSC0");

  TB->FRQ.set_ts_cnt("HVOSC1", 500E6);
  TB->FRQ.reset("HVOSC1");
  TB->FRQ.start("HVOSC1");
  
  TB->FRQ.set_ts_cnt("HVOSC2", 500E6);
  TB->FRQ.reset("HVOSC2");
  TB->FRQ.start("HVOSC2");
  
  TB->FRQ.set_ts_cnt("HVOSC3", 500E6);
  TB->FRQ.reset("HVOSC3");
  TB->FRQ.start("HVOSC3");
  
  /////////////////
  /* NOT ENABLED */
  /////////////////
  std::cout << "\n\n NOT ENABLED\n" << std::endl;
  
  TB->END.wrField(&AMACv2Reg::CntSetHV0en,  0);	//should be the default value
  TB->END.wrField(&AMACv2Reg::CntSetCHV0en, 0);
  TB->END.wrField(&AMACv2Reg::CntSetHV1en,  0);	
  TB->END.wrField(&AMACv2Reg::CntSetCHV1en, 0);
  TB->END.wrField(&AMACv2Reg::CntSetHV2en,  0);	
  TB->END.wrField(&AMACv2Reg::CntSetCHV2en, 0);
  TB->END.wrField(&AMACv2Reg::CntSetHV3en,  0);	
  TB->END.wrField(&AMACv2Reg::CntSetCHV3en, 0);
  
  TB->END.wrField(&AMACv2Reg::CntSetHV0frq, 0);
  TB->END.wrField(&AMACv2Reg::CntSetCHV0frq,0);
  TB->END.wrField(&AMACv2Reg::CntSetHV1frq, 0);
  TB->END.wrField(&AMACv2Reg::CntSetCHV1frq,0);
  TB->END.wrField(&AMACv2Reg::CntSetHV2frq, 0);
  TB->END.wrField(&AMACv2Reg::CntSetCHV2frq,0);
  TB->END.wrField(&AMACv2Reg::CntSetHV3frq, 0);
  TB->END.wrField(&AMACv2Reg::CntSetCHV3frq,0);
  
  TB->FRQ.toggle_reset_all();
  usleep(5.1E6); //5s wait for measure to finish
  
  TB->FRQ.read("HVOSC0");
  std::cout << "Measured HVOSC0 frequency: " << TB->FRQ.get_frq("HVOSC0") << "Hz" << std::endl;
  std::cout << "Measured HVOSC0 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC0") << std::endl;
  TB->FRQ.read("HVOSC1");
  std::cout << "Measured HVOSC1 frequency: " << TB->FRQ.get_frq("HVOSC1") << "Hz" << std::endl;
  std::cout << "Measured HVOSC1 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC1") << std::endl;
  TB->FRQ.read("HVOSC2");
  std::cout << "Measured HVOSC2 frequency: " << TB->FRQ.get_frq("HVOSC2") << "Hz" << std::endl;
  std::cout << "Measured HVOSC2 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC2") << std::endl;
  TB->FRQ.read("HVOSC3");
  std::cout << "Measured HVOSC3 frequency: " << TB->FRQ.get_frq("HVOSC3") << "Hz" << std::endl;
  std::cout << "Measured HVOSC3 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC3") << std::endl;
  
  /////////////////
  /* 00(DC)      */
  /////////////////
  std::cout << "\n\n 00(DC)\n" << std::endl;
  TB->END.wrField(&AMACv2Reg::CntSetHV0en,  1);	
  TB->END.wrField(&AMACv2Reg::CntSetCHV0en, 1);
  TB->END.wrField(&AMACv2Reg::CntSetHV1en,  1);	
  TB->END.wrField(&AMACv2Reg::CntSetCHV1en, 1);
  TB->END.wrField(&AMACv2Reg::CntSetHV2en,  1);	
  TB->END.wrField(&AMACv2Reg::CntSetCHV2en, 1);
  TB->END.wrField(&AMACv2Reg::CntSetHV3en,  1);	
  TB->END.wrField(&AMACv2Reg::CntSetCHV3en, 1);
  
  TB->END.wrField(&AMACv2Reg::CntSetHV0frq, 0);
  TB->END.wrField(&AMACv2Reg::CntSetCHV0frq,0);
  TB->END.wrField(&AMACv2Reg::CntSetHV1frq, 0);
  TB->END.wrField(&AMACv2Reg::CntSetCHV1frq,0);
  TB->END.wrField(&AMACv2Reg::CntSetHV2frq, 0);
  TB->END.wrField(&AMACv2Reg::CntSetCHV2frq,0);
  TB->END.wrField(&AMACv2Reg::CntSetHV3frq, 0);
  TB->END.wrField(&AMACv2Reg::CntSetCHV3frq,0);

  TB->FRQ.toggle_reset_all();
  usleep(5.1E6); //5s wait for measure to finish
  
  TB->FRQ.read("HVOSC0");
  std::cout << "Measured HVOSC0 frequency: " << TB->FRQ.get_frq("HVOSC0") << "Hz" << std::endl;
  std::cout << "Measured HVOSC0 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC0") << std::endl;
  TB->FRQ.read("HVOSC1");
  std::cout << "Measured HVOSC1 frequency: " << TB->FRQ.get_frq("HVOSC1") << "Hz" << std::endl;
  std::cout << "Measured HVOSC1 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC1") << std::endl;
  TB->FRQ.read("HVOSC2");
  std::cout << "Measured HVOSC2 frequency: " << TB->FRQ.get_frq("HVOSC2") << "Hz" << std::endl;
  std::cout << "Measured HVOSC2 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC2") << std::endl;
  TB->FRQ.read("HVOSC3");
  std::cout << "Measured HVOSC3 frequency: " << TB->FRQ.get_frq("HVOSC3") << "Hz" << std::endl;
  std::cout << "Measured HVOSC3 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC3") << std::endl;
  
  /////////////////
  /* 01(25kHz)   */
  /////////////////
  std::cout << "\n\n 01(25kHz) \n" << std::endl;
  
  TB->END.wrField(&AMACv2Reg::CntSetHV0frq, 1);
  TB->END.wrField(&AMACv2Reg::CntSetCHV0frq,1);
  TB->END.wrField(&AMACv2Reg::CntSetHV1frq, 1);
  TB->END.wrField(&AMACv2Reg::CntSetCHV1frq,1);
  TB->END.wrField(&AMACv2Reg::CntSetHV2frq, 1);
  TB->END.wrField(&AMACv2Reg::CntSetCHV2frq,1);
  TB->END.wrField(&AMACv2Reg::CntSetHV3frq, 1);
  TB->END.wrField(&AMACv2Reg::CntSetCHV3frq,1);

  TB->FRQ.toggle_reset_all();
  usleep(5.1E6); //5s wait for measure to finish
  
  TB->FRQ.read("HVOSC0");
  std::cout << "Measured HVOSC0 frequency: " << TB->FRQ.get_frq("HVOSC0") << "Hz" << std::endl;
  std::cout << "Measured HVOSC0 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC0") << std::endl;
  TB->FRQ.read("HVOSC1");
  std::cout << "Measured HVOSC1 frequency: " << TB->FRQ.get_frq("HVOSC1") << "Hz" << std::endl;
  std::cout << "Measured HVOSC1 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC1") << std::endl;
  TB->FRQ.read("HVOSC2");
  std::cout << "Measured HVOSC2 frequency: " << TB->FRQ.get_frq("HVOSC2") << "Hz" << std::endl;
  std::cout << "Measured HVOSC2 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC2") << std::endl;
  TB->FRQ.read("HVOSC3");
  std::cout << "Measured HVOSC3 frequency: " << TB->FRQ.get_frq("HVOSC3") << "Hz" << std::endl;
  std::cout << "Measured HVOSC3 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC3") << std::endl;  
  
  /////////////////
  /* 10(50kHz)   */
  /////////////////
  std::cout << "\n\n 10(50kHz) \n" << std::endl;
  
  TB->END.wrField(&AMACv2Reg::CntSetHV0frq, 2);
  TB->END.wrField(&AMACv2Reg::CntSetCHV0frq,2);
  TB->END.wrField(&AMACv2Reg::CntSetHV1frq, 2);
  TB->END.wrField(&AMACv2Reg::CntSetCHV1frq,2);
  TB->END.wrField(&AMACv2Reg::CntSetHV2frq, 2);
  TB->END.wrField(&AMACv2Reg::CntSetCHV2frq,2);
  TB->END.wrField(&AMACv2Reg::CntSetHV3frq, 2);
  TB->END.wrField(&AMACv2Reg::CntSetCHV3frq,2);

  TB->FRQ.toggle_reset_all();
  usleep(5.1E6); //5s wait for measure to finish
  
  TB->FRQ.read("HVOSC0");
  std::cout << "Measured HVOSC0 frequency: " << TB->FRQ.get_frq("HVOSC0") << "Hz" << std::endl;
  std::cout << "Measured HVOSC0 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC0") << std::endl;
  TB->FRQ.read("HVOSC1");
  std::cout << "Measured HVOSC1 frequency: " << TB->FRQ.get_frq("HVOSC1") << "Hz" << std::endl;
  std::cout << "Measured HVOSC1 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC1") << std::endl;
  TB->FRQ.read("HVOSC2");
  std::cout << "Measured HVOSC2 frequency: " << TB->FRQ.get_frq("HVOSC2") << "Hz" << std::endl;
  std::cout << "Measured HVOSC2 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC2") << std::endl;
  TB->FRQ.read("HVOSC3");
  std::cout << "Measured HVOSC3 frequency: " << TB->FRQ.get_frq("HVOSC3") << "Hz" << std::endl;
  std::cout << "Measured HVOSC3 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC3") << std::endl;
  
  /////////////////
  /* 11(100kHz)  */
  /////////////////
  std::cout << "\n\n 11(100kHz) \n" << std::endl;
  
  TB->END.wrField(&AMACv2Reg::CntSetHV0frq, 3);
  TB->END.wrField(&AMACv2Reg::CntSetCHV0frq,3);
  TB->END.wrField(&AMACv2Reg::CntSetHV1frq, 3);
  TB->END.wrField(&AMACv2Reg::CntSetCHV1frq,3);
  TB->END.wrField(&AMACv2Reg::CntSetHV2frq, 3);
  TB->END.wrField(&AMACv2Reg::CntSetCHV2frq,3);
  TB->END.wrField(&AMACv2Reg::CntSetHV3frq, 3);
  TB->END.wrField(&AMACv2Reg::CntSetCHV3frq,3);
  
  TB->FRQ.toggle_reset_all();
  usleep(5.1E6); //5s wait for measure to finish
  
  TB->FRQ.read("HVOSC0");
  std::cout << "Measured HVOSC0 frequency: " << TB->FRQ.get_frq("HVOSC0") << "Hz" << std::endl;
  std::cout << "Measured HVOSC0 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC0") << std::endl;
  TB->FRQ.read("HVOSC1");
  std::cout << "Measured HVOSC1 frequency: " << TB->FRQ.get_frq("HVOSC1") << "Hz" << std::endl;
  std::cout << "Measured HVOSC1 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC1") << std::endl;
  TB->FRQ.read("HVOSC2");
  std::cout << "Measured HVOSC2 frequency: " << TB->FRQ.get_frq("HVOSC2") << "Hz" << std::endl;
  std::cout << "Measured HVOSC2 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC2") << std::endl;
  TB->FRQ.read("HVOSC3");
  std::cout << "Measured HVOSC3 frequency: " << TB->FRQ.get_frq("HVOSC3") << "Hz" << std::endl;
  std::cout << "Measured HVOSC3 duty cycle: " << TB->FRQ.get_duty_cycle("HVOSC3") << std::endl;  
  
  
  // Power off
  TB->powerOff();
  std::cout << "Power OFF" << std::endl;
	
  return 0;
}
