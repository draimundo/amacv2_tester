#ifndef LTC2333_H
#define LTC2333_H

#include "ADCDevice.h"
#include "DeviceCom.h"
#include <vector>
#include <iostream>
#include <memory>

class LTC2333 : public ADCDevice
{
public:
  LTC2333(std::shared_ptr<DeviceCom> dev);
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
  //
  // FIXME: one drawback here right now is that the command sent is followed
  // by 24-bits worth of 0's, which means (a) this might be slower than
  // intended and (b) I'm not sure if this already initiates the read of 
  // *this* conversion. We'll have to play with this on the bench once the
  // board is built
  std::vector<unsigned int> setNextConversion(unsigned int chan, unsigned int span);

  // We can specify up to three conversions for each read. This only
  // returns the previous conversion result, and three subsequent reads are needed
  // to extract the results
  //
  // Input is a vector of size up to three containing (chan, span) pairs
  std::vector<unsigned int> setUpToThreeConversions(std::vector<std::pair<unsigned int, unsigned int>> vec);

  // Sends dummy signal and reads out previous conversion result
  std::vector<unsigned int> readPreviousConversion();

private:
  std::shared_ptr<DeviceCom> m_dev;

  const unsigned int m_chanMax = 0x7;
  const unsigned int m_spanMax = 0x7;

  // 3 bytes = 24 bits, which is enough for our ADC reads
  const unsigned int m_nBytesData = 3;

  bool checkValidInput(unsigned int chan, unsigned int span);
  unsigned int formatCommand(unsigned int chan, unsigned int span);
  std::vector<unsigned int> formatConversionResult(uint8_t* data);

};

#endif // LTC2333_H
