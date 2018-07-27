#include "AMACTB.h"
#include "AMAC.h"
#include "AMACTest.h"

#include <unistd.h>
#include <iostream>
#include <iomanip>
#include <vector>
#include <memory>

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

  // measure loop
  TB->END.wrField(&AMACv2Reg::VDDbg  , 0xE);
  TB->END.wrField(&AMACv2Reg::VDDbgen, 1);
  TB->END.wrField(&AMACv2Reg::AMbg   , 0xE);
  TB->END.wrField(&AMACv2Reg::AMbgen , 1);

  // Cal line
  TB->END.wrField(&AMACv2Reg::Ch4Mux, 1);
  test.runVoltageADC("CAL"  ,&AMACv2Reg::Ch4Value , TB->CAL);
  test.runVoltageADC("Hrefx",&AMACv2Reg::Ch10Value, TB->CAL);
  test.runVoltageADC("Hrefy",&AMACv2Reg::Ch11Value, TB->CAL);

  // Power off
  TB->powerOff();
  std::cout << "Power OFF" << std::endl;
  usleep(1E6); // 1s wait for a clean power down

  return 0;
}
