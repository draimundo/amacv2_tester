#include <iostream>
#include <iomanip>

#include "UIOCom.h"
#include "AMACTB.h"
#include <unistd.h>

int main(){
	std::cout << "Hello world!" << std::endl;
	std::shared_ptr<DeviceCom> uio = std::make_shared<UIOCom>("/dev/uio0", 0x10000);
	AMACTB TB (uio);
	TB.powerOff();
	std::cout << "Power off" << std::endl;
	usleep(1E6); // 1s wait for a clear power up
	TB.powerOn();
	std::cout << "Power on" << std::endl;
	return 0;
}