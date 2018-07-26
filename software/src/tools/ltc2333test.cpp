#include <unistd.h>

#include <memory>
#include <iostream>
#include <iomanip>
#include <vector>

#include "SPICom.h"
#include "LTC2333.h"
#include "ComIOException.h"
#include "AMACTB.h"
#include <time.h>

int main(int argc, char* argv[])
{
	
	
  std::string device="/dev/spidev1.5";
  AMACTB tb;
	
  tb.powerOn();
  tb.powerAMACOn();
	std::vector<std::pair<uint8_t, uint8_t>> vec;
	//vec.push_back(std::make_pair(0,0));
	//vec.push_back(std::make_pair(1,0));
	vec.push_back(std::make_pair(2,0));
	//vec.push_back(std::make_pair(3,0));
	//vec.push_back(std::make_pair(4,0));
	//vec.push_back(std::make_pair(5,0));
	//vec.push_back(std::make_pair(6,0));
	//vec.push_back(std::make_pair(7,0));
	tb.ADC0.setADC(vec);
	usleep(3E6);
	tb.ADC0.setADC(vec);
  try
    {
      // Create the communication object
			std::cout << "before while" << std::endl;


      while(true){
				//tb.ADC0.setADC(vec);
        std::vector<LTC2333Outputs> outputs = tb.ADC0.getADC();

				usleep(1E6);
				
        for(int i = 0; i < outputs.size(); ++i){
          auto output = outputs.at(i);
					std::cout << i << ": " << output.result * 5. / 65535. << " aka " << output.result << std::endl;
        }
      }

    }
  catch(ComIOException e){
			std::cout << "caught" << std::endl;
			std::cout << "errno = " << errno << std::endl;
      std::cout << e.what() << std::endl;
    }
	catch(...){
		std::cout << "caught something" << std::endl;
	}
  return 0;
}
