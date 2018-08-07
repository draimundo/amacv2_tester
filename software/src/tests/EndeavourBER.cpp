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

  // Initialize the AMAC communication
  try
    {
      TB->END.init();
    }
  catch(EndeavourComException &e)
    {
      std::cout << e.what() << std::endl;
      return 1;
    }
  std::cout << "Endeavour OK" << std::endl;
  usleep(1e6);

  // BER loop
  test.runBERvsClock();

  // Power off
  TB->powerOff();
  std::cout << "Power OFF" << std::endl;
  usleep(1E6); // 1s wait for a clean power down

  return 0;
}
