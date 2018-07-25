#include <iostream>
#include <iomanip>

#include "UIOCom.h"
#include "AMACTB.h"
#include <unistd.h>

int main()
{
  std::shared_ptr<DeviceCom> uio = std::make_shared<UIOCom>("/dev/uio0", 0x10000);
  AMACTB TB (uio);
  TB.powerOff();
  std::cout << "Power off" << std::endl;
  return 0;
}
