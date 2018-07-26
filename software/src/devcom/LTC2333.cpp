#include "LTC2333.h"
#include <unistd.h>
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

/*std::vector<unsigned int> LTC2333::setNextConversion(unsigned int chan, unsigned int span){

  // Check that chan and span are in range
  if( !checkValidInput(chan, span) ) return {};

  // Format our 8-bit word of cmd code, chan, and span
  unsigned int input = formatCommand(chan, span);

  // 24-bit array for the values we'll read out
  uint8_t data[m_nBytesData];

  // Use the read_reg(vector, ...) function to avoid sending the extra 0's for now
  std::vector<unsigned int> input_vec;
  input_vec.push_back(input);

  // FIXME note this no longer works / is deprecated
  // Now read the input register, and pass the data array along to fill it
  //m_dev->read_reg(input_vec, data, m_nBytesData);
  

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

  // FIXME deprecated
  // Now read the input register, and pass the data array along to fill it
  //m_dev->read_reg(input_vec, data, m_nBytesData);

  return formatConversionResult(data);

}

std::vector<unsigned int> LTC2333::readPreviousConversion(){

  // Dummy input value, which won't initiate the next conversion, and will only
  // read the previous one.
  unsigned int input = 0x0;

  // 24-bit array for the values we'll read out
  uint8_t data[m_nBytesData];

  // Use the read_reg(vector, ...) function to avoid sending the extra 0's for now
  std::vector<unsigned int> input_vec;
  input_vec.push_back(input);

  // FIXME deprecated
  // Now read the input register, and pass the data array along to fill it
  //m_dev->read_reg(input_vec, data, m_nBytesData);

  return formatConversionResult(data);

}*/

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


/*std::vector<LTC2333Outputs> LTC2333::sendABunchOfChanSpan(
    std::vector<std::pair<uint8_t,uint8_t>> inputVec
    ){

  unsigned int nBytesIn = inputVec.size();
  if(nBytesIn > 16){
    std::cout << "LTC2333::sendABunchOfChanSpan ERROR invalid chan/span" << std::endl;
    std::cout << "Exiting sendABunchOfChanSpan" << std::endl;
    return {};
  }

  std::cout << "here" << std::endl;

  // Keep track of number of bytes from previous transfer in order to fully empty the buffer
  static unsigned int old_nBytesOut = 0;

  // Need to take the max to be sure we can:
  // a) send all of our bytes
  // b) receive all of the bytes from the previous cmd
  unsigned int nBytesToTransmit = std::max(old_nBytesOut, nBytesIn);

  uint8_t tx[nBytesToTransmit] = { 0, }; 
  uint8_t rx[old_nBytesOut] = { 0, }; 
  uint8_t dummy[nBytesToTransmit] = { 0, }; 

  std::cout << "here2" << std::endl;

  for(unsigned int i = 0; i < nBytesIn; ++i){

    auto inputPair = inputVec.at(i);

    uint8_t chan = inputPair.first;
    uint8_t span = inputPair.second;

    // Check that chan and span are in range
    if( !checkValidInput(chan, span) ){
      // ERROR and maybe return
      std::cout << "LTC2333::sendABunchOfChanSpan ERROR invalid chan/span" << std::endl;
      std::cout << "Exiting sendABunchOfChanSpan" << std::endl;
      return {};
    }

    // Format our 8-bit word of cmd code, chan, and span
    tx[i] = (uint8_t) formatCommand(chan, span);
    std::cout << "tx[" << i << "] is " << std::hex << unsigned(tx[i]) << std::endl;
  }

  std::cout << "here3" << std::endl;

  std::cout << "tx is " << std::hex << (unsigned long long)tx[0] << std::endl;


  // Now specify the input register
  m_dev->read_reg(tx, dummy, nBytesToTransmit);

  std::cout << "here4" << std::endl;

  // sleep long enough to allow the conversions to happen at 25 MHz. This ends up
  // being 1 us per read
  usleep(nBytesToTransmit);

  // Now pass the rx so that we can read our (possibly many) previous ioctl call's values
  m_dev->read_reg( dummy, rx, old_nBytesOut);

  std::cout << "here5" << std::endl;

  std::vector<LTC2333Outputs> outputs;

  // Iterate 3-bytes at a time
  for(unsigned int i = 0; i < old_nBytesOut; i+=3){

    LTC2333Outputs output_i;

    // 16 bit conversion result
    output_i.result = (rx[i] << 8) | (rx[i+1] );
    output_i.chan = (rx[i+2] >> 3) & m_chanMax;
    output_i.span = rx[i+2] & m_spanMax;

    outputs.push_back(output_i);
  }

  std::cout << "here6" << std::endl;


  // Save this to the static variable
  old_nBytesOut = 3*nBytesIn;

  return outputs;

}*/

void LTC2333::setADC(std::vector<std::pair<uint8_t,uint8_t>> inputSettings){
	uint8_t nBytesIn = inputSettings.size();
  if(nBytesIn > 16){
    std::cout << "LTC2333::setDAC ERROR too many chan/span" << std::endl;
    std::cout << "Exiting setDAC" << std::endl;
    return;
  }
	std::cout << "nbytesIn: " << unsigned(nBytesIn) << std::endl;
	uint8_t tx[nBytesIn] = {0, };
	
	for(unsigned int i = 0; i < nBytesIn; ++i){

    auto inputPair = inputSettings.at(i);

    uint8_t chan = inputPair.first;
    uint8_t span = inputPair.second;

    // Check that chan and span are in range
    if( !checkValidInput(chan, span) ){
      // ERROR and maybe return
      std::cout << "LTC2333::setDAC ERROR invalid chan/span" << std::endl;
      std::cout << "Exiting setDAC" << std::endl;
      return;
    }

    // Format our 8-bit word of cmd code, chan, and span
    tx[i] = (uint8_t) formatCommand(chan, span);
    std::cout << "tx[" << i << "] is " << std::hex << unsigned(tx[i]) << std::endl;
		m_init = true;
  }
	
	m_inputSettings = inputSettings;
	m_nBytesIn = nBytesIn;
	m_dev->read_reg(tx, NULL, nBytesIn);
	usleep(m_nBytesIn); //sleep for tx
}

std::vector<LTC2333Outputs> LTC2333::getADC(){
	
	if(!m_init){
		std::vector<std::pair<uint8_t, uint8_t>> vec;
    //vec.push_back(std::make_pair(0,0));
    // vec.push_back(std::make_pair(1,0));
    vec.push_back(std::make_pair(2,0));
    // vec.push_back(std::make_pair(3,0));
    // vec.push_back(std::make_pair(4,0));
    // vec.push_back(std::make_pair(5,0));
    // vec.push_back(std::make_pair(6,0));
    // vec.push_back(std::make_pair(7,0));
		LTC2333::setADC(vec);
	}
	
	//Set ADC_CNV pin
	uint32_t data = m_dio->read_reg(0x2); 
	uint32_t mask = (uint32_t)(1 << 7);
	data = (data & ~mask) | (true << 7);
	m_dio->write_reg(0x2, data);
	//Reset ADC_CNV pin
	data = m_dio->read_reg(0x2); 
	mask = (uint32_t)(1 << 7);
	data = (data & ~mask) | (false << 7);
	m_dio->write_reg(0x2, data);
	usleep(1); //wait for conversion to finish
	uint8_t rx[3*m_nBytesIn] = {0, }; 
	uint8_t  dummy [3*m_nBytesIn] = {0, };
	m_dev->read_reg(dummy, NULL, 3*m_nBytesIn); //activate CS+clock for a 192 clock cycles
	usleep(m_nBytesIn); //wait for rx buffer to fill
	m_dev->read_reg(dummy, rx, 3*m_nBytesIn); //recover data in rx (clocks will also be activated...)
	std::vector<LTC2333Outputs> outputs;

  // Iterate 3-bytes at a time
  for(unsigned int i = 0; i < 3*m_nBytesIn; i+=3){
    LTC2333Outputs output_i;
    // 16 bit conversion result
    output_i.result = (rx[i] << 8) | (rx[i+1] );
    std::cout << "output_i.result " << (unsigned) output_i.result << " for i = " << i << std::endl;
    output_i.chan = (rx[i+2] >> 3) & m_chanMax;
    std::cout << "output_i.chan " << (unsigned) output_i.chan << " for i = " << i << std::endl;
    output_i.span = rx[i+2] & m_spanMax;
    std::cout << "output_i.span " << (unsigned) output_i.span << " for i = " << i << std::endl;
    outputs.push_back(output_i);
  }
  return outputs;
}




