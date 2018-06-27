#include <iostream>
#include <iomanip>
#include <thread>
#include <chrono>

#include "SPICom.h"
#include "BME280.h"

int main()
{
  std::shared_ptr<SPICom> spi=std::make_shared<SPICom>("/dev/spidev1.0");
  BME280 sensor(spi);
  sensor.init();
  
  sensor.dump();


  //
  // Start reading
  std::cout << std::endl << "data" << std::endl;
  uint8_t initcode;

  initcode=0;
  initcode|=1; // 1 sample humidity
  spi->write_reg(0x72, initcode);

  initcode=0;
  initcode|=3; // read constantly
  initcode|=1<<2; // 1 sample pressure
  initcode|=1<<5; // 1 sample temperature
  spi->write_reg(0x74, initcode);
  std::this_thread::sleep_for(std::chrono::milliseconds(500));

  // The sampling loop
  uint8_t data[3];
  for(uint i=0;i<1000;i++)
    {
      std::cout << sensor.temperature() << "\t" << sensor.pressure() << "\t" << sensor.humidity() << std::endl;
      std::this_thread::sleep_for(std::chrono::seconds(1));
    }

  return 0;
}
