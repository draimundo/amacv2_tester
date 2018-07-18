#include "LTC2333.h"

LTC2333::LTC2333(std::shared_ptr<DeviceCom> dev) : m_dev(dev){
  init();
}

LTC2333::~LTC2333()
{ 

}

void LTC2333::init(){
  reset();
}

void LTC2333::reset(){
  
}

std::vector<unsigned int> LTC2333::setNextConversion(unsigned int chan, unsigned int span){

  if(chan > chanMax){
    std::cout << "LTC2333::setNextConversion ERROR chan is" << std::hex << chan << ", but chanMax is" << std::hex << chanMax << std::endl;
    std::cout << "Exiting setNextConversion" << std::endl;
    return {};
  }

  if(span > spanMax){
    std::cout << "LTC2333::setNextConversion ERROR span is" << std::hex << span << ", but spanMax is" << std::hex << spanMax << std::endl;
    std::cout << "Exiting setNextConversion" << std::endl;
    return {};
  }

  // cmd header for MUX control (10 in binary)
  unsigned int cmd = 0x2;

  chan = chan & chanMax;
  span = span & spanMax;

  // input is 8 bits, so shift the 2-bit header over by 6
  // and the 3-bit middle part by 3
  unsigned int input = (cmd << 6) | (chan << 3) | span;

  // 24-bit array for the values we'll read out
  uint8_t data[nBytesData];

  // Now read the input register, and pass the data array along to fill it
  m_dev->read_reg(input, data, nBytesData);

  return formatConversionResult(data);

}

std::vector<unsigned int> LTC2333::readPreviousConversion(){

  // Dummy input value, which won't initiate the next conversion, and will only
  // read the previous one.
  unsigned int input = 0x0;

  // 24-bit array for the values we'll read out
  uint8_t data[nBytesData];

  // Now read the input register, and pass the data array along to fill it
  m_dev->read_reg(input, data, nBytesData);

  return formatConversionResult(data);

}

std::vector<unsigned int> LTC2333::formatConversionResult(uint8_t* data){

  // Here we parse the 8-bit data into a single unsigned int
  unsigned int output = 0;
  for(unsigned int index = 0; index < nBytesData; ++index){
    output = (output << 8) | data[index];
  }

  // Now split output into its components
  unsigned int output_span = output & spanMax;
  unsigned int output_chan = (output >> 3) & chanMax;

  // Here is the 18-bit result
  unsigned int output_result = (output >> 6) & 0x3FFFF; // 0x3FFFF = 2^18-1

  return {output_result, output_chan, output_span};

}
