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

  test.runZeroCalib("CH0", &AMACv2Reg::Ch0Value );
  test.runZeroCalib("CH1", &AMACv2Reg::Ch1Value );
  test.runZeroCalib("CH2", &AMACv2Reg::Ch2Value );
  test.runZeroCalib("CH3", &AMACv2Reg::Ch3Value );
  test.runZeroCalib("CH4", &AMACv2Reg::Ch4Value );
  test.runZeroCalib("CH5", &AMACv2Reg::Ch5Value );
  test.runZeroCalib("CH6", &AMACv2Reg::Ch6Value );
  test.runZeroCalib("CH7", &AMACv2Reg::Ch7Value );
  test.runZeroCalib("CH8", &AMACv2Reg::Ch8Value );
  test.runZeroCalib("CH9", &AMACv2Reg::Ch9Value );
  test.runZeroCalib("CH10",&AMACv2Reg::Ch10Value);
  test.runZeroCalib("CH11",&AMACv2Reg::Ch11Value);
  test.runZeroCalib("CH12",&AMACv2Reg::Ch12Value);
  test.runZeroCalib("CH13",&AMACv2Reg::Ch13Value);
  test.runZeroCalib("CH14",&AMACv2Reg::Ch14Value);
  test.runZeroCalib("CH15",&AMACv2Reg::Ch15Value);
  
  std::cout << "-- Start zero calib-- "  << std::endl;
  std::cout << "ch0 : " << TB->END.rdField(&AMACv2Reg::Ch0Value ) << std::endl;
  std::cout << "ch1 : " << TB->END.rdField(&AMACv2Reg::Ch1Value ) << std::endl;
  std::cout << "ch2 : " << TB->END.rdField(&AMACv2Reg::Ch2Value ) << std::endl;
  std::cout << "ch3 : " << TB->END.rdField(&AMACv2Reg::Ch3Value ) << std::endl;
  std::cout << "ch4 : " << TB->END.rdField(&AMACv2Reg::Ch4Value ) << std::endl;
  std::cout << "ch5 : " << TB->END.rdField(&AMACv2Reg::Ch5Value ) << std::endl;
  std::cout << "ch6 : " << TB->END.rdField(&AMACv2Reg::Ch6Value ) << std::endl;
  std::cout << "ch7 : " << TB->END.rdField(&AMACv2Reg::Ch7Value ) << std::endl;
  std::cout << "ch8 : " << TB->END.rdField(&AMACv2Reg::Ch8Value ) << std::endl;
  std::cout << "ch9 : " << TB->END.rdField(&AMACv2Reg::Ch9Value ) << std::endl;
  std::cout << "ch10: " << TB->END.rdField(&AMACv2Reg::Ch10Value) << std::endl;
  std::cout << "ch12: " << TB->END.rdField(&AMACv2Reg::Ch11Value) << std::endl;
  std::cout << "ch11: " << TB->END.rdField(&AMACv2Reg::Ch11Value) << std::endl;
  std::cout << "ch12: " << TB->END.rdField(&AMACv2Reg::Ch12Value) << std::endl;
  std::cout << "ch13: " << TB->END.rdField(&AMACv2Reg::Ch13Value) << std::endl;
  std::cout << "ch14: " << TB->END.rdField(&AMACv2Reg::Ch14Value) << std::endl;
  std::cout << "ch15: " << TB->END.rdField(&AMACv2Reg::Ch15Value) << std::endl;
  
  // Power off
  TB->powerOff();
  std::cout << "Power OFF" << std::endl;
  usleep(1E6); // 1s wait for a clean power down

  return 0;
}
