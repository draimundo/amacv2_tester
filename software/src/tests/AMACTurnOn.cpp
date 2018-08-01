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

  // Power off
  TB->powerOff();
  std::cout << "Power OFF" << std::endl;
  usleep(1E6); // 1s wait for a clean power down

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

  return 0;
}
