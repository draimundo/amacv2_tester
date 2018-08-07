#include "AMACTB.h"
#include "AMACTest.h"

#include <iostream>

int main()
{
  std::cout << "-- Current measurement program --" << std::endl;

  std::shared_ptr<AMACTB> TB=std::make_shared<AMACTB>();

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

  AMACTest test("AMACREF3",TB);

  // Power measurement
  test.runPower();
  
  // Power off
  TB->powerOff();
  std::cout << "Power OFF" << std::endl;
  usleep(1E6); // 1s wait for a clean power d
}  
