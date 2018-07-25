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

      try
        {      
          TB.END.setid(EndeavourCom::REFMODE::IDPads, 0x1F);
          std::cout << "SETID" << std::endl;
          usleep(1E6);

          unsigned int data=TB.END.read_reg(31);
          std::cout << "Register 31: " << std::hex << data << std::endl;
          usleep(1E6); // 1s wait for a clear send

          data=TB.END.read_reg(52);
          std::cout << "Register 52: " << std::hex << data << std::endl;
          usleep(1E6); // 1s wait for a clear send

          TB.END.write_reg(52, 0x9F9F);
          std::cout << "BG set" << std::endl;
          usleep(1E6); // 1s wait for a clear send

          TB.END.read_reg(52);
          data=TB.END.read_reg(52);
          std::cout << "Register 52: " << std::hex << data << std::endl;      
          usleep(10E6); // 1s wait for a clear send
        }
      catch(EndeavourComException e)
        {
          std::cout << e.what() << std::endl;
        }
    }

  // Power off
  TB.powerOff();
  std::cout << "Power OFF" << std::endl;
  usleep(1E6); // 1s wait for a clean power down

  return 0;
}
