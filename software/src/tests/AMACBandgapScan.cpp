#include "AMACTB.h"
#include "AMAC.h"
#include "AMACTest.h"

#include "ComIOException.h"
#include "EndeavourComException.h"

#include <unistd.h>
#include <iostream>
#include <iomanip>
#include <vector>
#include <memory>

#include <math.h>

int main()
{
  std::shared_ptr<AMACTB> TB;

  try
    {
      TB=std::make_shared<AMACTB>();

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
      TB->END.init();
    }
  catch(ComIOException &e)
    {
      std::cout << e.what() << std::endl;
      return 1;
    }
  catch(EndeavourComException &e)
    {
      std::cout << e.what() << std::endl;
      return 1;
    }

  AMACTest test("AMACREF3",TB);

  std::cout << "Endeavour OK" << std::endl;
  usleep(1e6);

  //
  // The actual test
  test.runBandgapScan();

  // Power off
  TB->powerOff();
  std::cout << "Power OFF" << std::endl;
  usleep(1E6); // 1s wait for a clean power down

  return 0;
}
