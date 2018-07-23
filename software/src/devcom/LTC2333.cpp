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

  // Check that chan and span are in range
  if( !checkValidInput(chan, span) ) return {};

  // Format our 8-bit word of cmd code, chan, and span
  unsigned int input = formatCommand(chan, span);

  // 24-bit array for the values we'll read out
  uint8_t data[m_nBytesData];

  // Now read the input register, and pass the data array along to fill it
  m_dev->read_reg(input, data, m_nBytesData);

  return formatConversionResult(data);

  }

std::vector<unsigned int> LTC2333::setUpToThreeConversions(std::vector<std::pair<unsigned int, unsigned int>> vec){

  if(vec.size() > 3){
    std::cout << "LTC2333::setUpToThreeConversions ERROR vec.size() is" << std::hex << vec.size() << ", but the max size expected is 3" << std::endl;
    std::cout << "Exiting setUpToThreeConversions" << std::endl;
    return {};
  }

  std::vector<unsigned int> input_vec;

  for(auto chanSpanPair : vec){

    unsigned int chan = chanSpanPair.first;
    unsigned int span = chanSpanPair.second;

    // Check that chan and span are in range
    if( !checkValidInput(chan, span) ) return {};

    // Format our 8-bit word of cmd code, chan, and span.
    // Then put it into our vector, which we'll let SPICom handle
    input_vec.push_back( formatCommand(chan, span) );
  }

  // 24-bit array for the values we'll read out
  uint8_t data[m_nBytesData];

  // Now read the input register, and pass the data array along to fill it
  m_dev->read_reg(input_vec, data, m_nBytesData);

  return formatConversionResult(data);

}

std::vector<unsigned int> LTC2333::readPreviousConversion(){

  // Dummy input value, which won't initiate the next conversion, and will only
  // read the previous one.
  unsigned int input = 0x0;

  // 24-bit array for the values we'll read out
  uint8_t data[m_nBytesData];

  // Now read the input register, and pass the data array along to fill it
  m_dev->read_reg(input, data, m_nBytesData);

  return formatConversionResult(data);

}

bool LTC2333::checkValidInput(unsigned int chan, unsigned int span){

  if(chan > m_chanMax){
    std::cout << "LTC2333::checkValidInput ERROR chan is" << std::hex << chan << ", but chanMax is" << std::hex << m_chanMax << std::endl;
    std::cout << "Exiting checkValidInput" << std::endl;
    return false;
  }

  if(span > m_spanMax){
    std::cout << "LTC2333::checkValidInput ERROR span is" << std::hex << span << ", but spanMax is" << std::hex << m_spanMax << std::endl;
    std::cout << "Exiting checkValidInput" << std::endl;
    return false;
  }

  return true;
}


unsigned int LTC2333::formatCommand(unsigned int chan, unsigned int span){

  // cmd header for MUX control (10 in binary)
  unsigned int cmd = 0x2;

  chan = chan & m_chanMax;
  span = span & m_spanMax;

  // input is 8 bits, so shift the 2-bit header over by 6
  // and the 3-bit middle part by 3
  unsigned int input = (cmd << 6) | (chan << 3) | span;
  return input;
}

std::vector<unsigned int> LTC2333::formatConversionResult(uint8_t* data){

  // Here we parse the 8-bit data into a single unsigned int
  unsigned int output = 0;
  for(unsigned int index = 0; index < m_nBytesData; ++index){
    output = (output << 8) | data[index];
  }

  // Now split output into its components
  unsigned int output_span = output & m_spanMax;
  unsigned int output_chan = (output >> 3) & m_chanMax;

  // Here is the 18-bit result
  unsigned int output_result = (output >> 6) & 0xFFFF; // 0xFFFF = 2^16-1

  return {output_result, output_chan, output_span};
}
