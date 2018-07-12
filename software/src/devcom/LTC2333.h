#ifndef LTC2333_H
#define LTC2333_H

#include "ADCDevice.h"
#include "SPICom.h"
#include <vector>
#include <iostream>

class LTC2333 : public ADCDevice
{
public:
  LTC2333(SPICom* spi);
  ~LTC2333();

  void init();
  void reset();

  // Sets next conversion result for specified channel and span, and
  // reads out previous conversion result.
  //
  // Return value is a vector of length three, containing:
  // index 0: 18-bit conversion result
  // index 1: 3-bit channel ID
  // index 2: 3-bit soft span value
  //
  // Valid channels are 0-7.
  //
  // Valid spans are:
  // 
  // 0: 0V to 1.25*V_refbuf/1.024
  // 1: 0V to 1.25*V_refbuf
  // 2: +/-1.25*V_refbuf/1.024
  // 3: +/-1.25*V_refbuf
  // 4: 0V to 2.5*V_refbuf/1.024
  // 5: 0V to 2.5*V_refbuf
  // 6: +/-2.5*V_refbuf/1.024
  // 7: +/-2.5*V_refbuf
  std::vector<unsigned int> setNextConversion(unsigned int chan, unsigned int span);

  // Sends dummy signal and reads out previous conversion result
  std::vector<unsigned int> readPreviousConversion();

private:
  SPICom* m_spi;

  const unsigned int chanMax = 0x7;
  const unsigned int spanMax = 0x7;

  // 3 bytes = 24 bits, which is enough for our ADC reads
  const unsigned int nBytesData = 3;

  std::vector<unsigned int> formatConversionResult(uint8_t* data);

};

#endif // LTC2333_H
