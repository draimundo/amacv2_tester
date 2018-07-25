#include "AMACTB.h"
#include <unistd.h>
#include <iostream>
#include <iomanip>
#include <vector>

int main()
{
  AMACTB TB;

  // Power off
  TB.powerOff();
  std::cout << "Power OFF" << std::endl;
  usleep(1E6); // 1s wait for a clean power down
	
  // Power on
  TB.powerOn();
  usleep(1E6); // 1s wait for a clean power up
  std::cout << "Power ON" << std::endl;

  // Configure I/O pads
  TB.setIDPads(0x1F);
  TB.setIO(TB.ResetB, true);

  while(true)
    {
      // Power off AMAC
      TB.powerAMACOff();
      std::cout << "AMAC OFF" << std::endl;
      usleep(1E6);

      // Power on AMAC
      TB.powerAMACOn();
      std::cout << "AMAC ON" << std::endl;
      usleep(1E6);

      // SETID
      TB.END.setid(EndeavourCom::REFMODE::IDPads, 0x1F);
      std::cout << "SETID" << std::endl;
      usleep(1E6); // 1s wait for a clear send
    }

  // Power off
  TB.powerOff();
  std::cout << "Power OFF" << std::endl;
  usleep(1E6); // 1s wait for a clean power down

  return 0;
}
