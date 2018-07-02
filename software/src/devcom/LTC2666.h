#ifndef LTC2666_H
#define LTC2666_H

#include "DACDevice.h"
#include "SPICom.h"
#include <vector>
#include <iostream>

class LTC2666 : public DACDevice
{
public:
  LTC2666(SPICom* spi);
  ~LTC2666();

  void init();
  void reset();

  // Write and update all channels with given number of counts (as a 16 bit number).
  void writeUpdateAll(unsigned int counts);

  // Write and update channel with given number of counts (as a 16 bit number).
  // Valid channels are 0-7
  void writeUpdateChan(unsigned int chan, unsigned int counts);

  // Turn off all DACs.
  // Channel will automatically turn back on after an update signal.
  void powerDownAll();

  // Turn off DAC channel.
  // Channel will automatically turn back on after an update signal.
  // Valid channels are 0-7
  void powerDownChan(unsigned int chan);

  // Valid spans are:
  // 
  // 0: 0V to 5V unipolar
  // 1: 0V to 10V unipolar
  // 2: -5V to 5V bipolar
  // 3: -10V to 10V bipolar
  // 4: -2.5V to 2.5V bipolar
  void changeSpanAll(unsigned int span);

  // Valid channels are 0-7
  void changeSpanChan(unsigned int chan, unsigned int span);

  // Route channel to the MUX; maybe not so useful for us.
  // Valid channels are:
  //
  // 0-7: Vout_0 -> Vout_7
  // 8: REFLO
  // 9: REF
  // A: Temperature monitor
  // B: V+
  // C: V-
  void pointMuxAtChan(unsigned int chan);

  // Disable the MUX
  void disableMux();

private:
  SPICom* m_spi;

  const unsigned int chanMax = 0x7;
  const unsigned int muxChanMax = 0xC;
  const unsigned int spanMax = 0x4;
};

#endif // LTC2666_H