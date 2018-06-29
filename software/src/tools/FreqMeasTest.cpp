#include <iostream>
#include <iomanip>
#include <unistd.h>

#include "UIOCom.h"
#include "FreqMeas.h"

#define FCLK 100E6

int main(){
	std::cout << "Hello world!" << std::endl;
    std::shared_ptr<DeviceCom> uio = std::make_shared<UIOCom>("/dev/uio2", 0x10000);
	FreqMeas dev (uio, 0, 10000);
	
	std::cout << "Running reset" << std::endl;
	dev.reset();
	
	std::cout << "Starting measurments" << std::endl;
	dev.start();
	dev.read();
	while(true){
		dev.freeze(false);
		usleep(2E6);
		std::cout << "\nhi_n " << dev.hi_n << std::endl;
		std::cout << "hi_flg " << dev.hi_flg << std::endl;
		std::cout << "lo_n " << dev.lo_n << std::endl;
		std::cout << "lo_flg " << dev.lo_flg << std::endl;
		std::cout << "hi_t " << dev.hi_t << std::endl;
		std::cout << "t_flg " << dev.t_flg << std::endl;

		std::cout << "Measured frequency: " << ((float)dev.hi_n/dev.get_ts_cnt())*FCLK << "Hz" << std::endl;

		dev.freeze();
		dev.read();
	}
	
	
	return 0;
}
