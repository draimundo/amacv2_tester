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

  TB->END.wrField(&AMACv2Reg::CntSetHV0frq,1);
  TB->END.wrField(&AMACv2Reg::CntSetCHV0frq,1);
  TB->END.wrField(&AMACv2Reg::CntSetHV1frq,1);
  TB->END.wrField(&AMACv2Reg::CntSetCHV1frq,1);
  TB->END.wrField(&AMACv2Reg::CntSetHV2frq,1);
  TB->END.wrField(&AMACv2Reg::CntSetCHV2frq,1);
  TB->END.wrField(&AMACv2Reg::CntSetHV3frq,1);
  TB->END.wrField(&AMACv2Reg::CntSetCHV3frq,1);

  TB->END.wrField(&AMACv2Reg::CntSetHV0en,1);	
  TB->END.wrField(&AMACv2Reg::CntSetCHV0en,1);
  TB->END.wrField(&AMACv2Reg::CntSetHV1en,1);	
  TB->END.wrField(&AMACv2Reg::CntSetCHV1en,1);
  TB->END.wrField(&AMACv2Reg::CntSetHV2en,1);	
  TB->END.wrField(&AMACv2Reg::CntSetCHV2en,1);
  TB->END.wrField(&AMACv2Reg::CntSetHV3en,1);	
  TB->END.wrField(&AMACv2Reg::CntSetCHV3en,1);

  TB->setDAC(TB->RgOsc_Vref, 0.3);
  TB->FRQ.reset("CLKOUT");
  TB->FRQ.start("CLKOUT");
  usleep(1E6); //1s wait for conv and display
  std::cout << "Measured CLKOUT frequency: " << TB->FRQ.get_frq("CLKOUT") << "Hz" << std::endl;

  TB->setDAC(TB->HVOsc_Vref, 0.15);
  TB->FRQ.set_ts_cnt("HVOSC0", 2.1*50E6);
  TB->FRQ.reset("HVOSC0");
  TB->FRQ.start("HVOSC0");
  usleep(1E6); //1s wait for conv and display
  std::cout << "Measured HVOSC0 frequency: " << TB->FRQ.get_frq("HVOSC0") << "Hz" << std::endl;

  TB->setDAC(TB->HVOsc_Vref, 0.15);
  TB->FRQ.set_ts_cnt("HVOSC1", 2.1*50E6);
  TB->FRQ.reset("HVOSC1");
  TB->FRQ.start("HVOSC1");
  usleep(1E6); //1s wait for conv and display
  std::cout << "Measured HVOSC1 frequency: " << TB->FRQ.get_frq("HVOSC1") << "Hz" << std::endl;

  TB->setDAC(TB->HVOsc_Vref, 0.15);
  TB->FRQ.set_ts_cnt("HVOSC2", 2.1*50E6);
  TB->FRQ.reset("HVOSC2");
  TB->FRQ.start("HVOSC2");
  usleep(1E6); //1s wait for conv and display
  std::cout << "Measured HVOSC2 frequency: " << TB->FRQ.get_frq("HVOSC2") << "Hz" << std::endl;

  TB->setDAC(TB->HVOsc_Vref, 0.15);
  TB->FRQ.set_ts_cnt("HVOSC3", 2.1*50E6);
  TB->FRQ.reset("HVOSC3");
  TB->FRQ.start("HVOSC3");
  usleep(1E6); //1s wait for conv and display
  std::cout << "Measured HVOSC3 frequency: " << TB->FRQ.get_frq("HVOSC3") << "Hz" << std::endl;

  // Power off
  TB->powerOff();
  std::cout << "Power OFF" << std::endl;
  usleep(1E6); // 1s wait for a clean power down

	
  return 0;
}
