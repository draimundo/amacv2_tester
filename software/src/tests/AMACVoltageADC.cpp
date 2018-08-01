#include "AMACTB.h"
#include "AMAC.h"
#include "AMACTest.h"

#include "EndeavourComException.h"

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

  // Set ID, with two tries to be sure of success
  try
  {      
    TB->END.setid(EndeavourCom::REFMODE::IDPads, 0x1F);
    std::cout << "SETID" << std::endl;
    usleep(1E6);
  }
  catch(EndeavourComException e)
  {
    std::cout << e.what() << std::endl;
    usleep(2E6);
  }

  try
  {      
    TB->END.setid(EndeavourCom::REFMODE::IDPads, 0x1F);
    std::cout << "SETID" << std::endl;
    usleep(1E6);
  }
  catch(EndeavourComException e)
  {
    std::cout << e.what() << std::endl;
    usleep(2E6);
  }

  // measure loop
  TB->END.wrField(&AMACv2Reg::VDDbg  , 0xE);
  TB->END.wrField(&AMACv2Reg::VDDbgen, 1);
  TB->END.wrField(&AMACv2Reg::AMbg   , 0xE);
  TB->END.wrField(&AMACv2Reg::AMbgen , 1);
  usleep(1E6);

  // Setting which has given us 1 mV / count
  //TB->END.write_reg(52, 0x898D); // VDD = 1.206 for AMAC #10 (value from the spec)
  //TB->END.write_reg(52, 0x898B); // VDD = 1.255 for AMAC #10 (1.277 for AMAC #9)
  //std::cout << "VDD and AM BG" << std::endl;
  //usleep(1E6);

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
