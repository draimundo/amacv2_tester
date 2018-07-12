#ifndef ADCDevice_H
#define ADCDevice_H

#include <vector>

class ADCDevice
{
public:
  ADCDevice();
  virtual ~ADCDevice();

  virtual void init() = 0;
  virtual void reset() = 0;

  // Sets next conversion result for specified channel and span, and
  // reads out previous conversion result.
  virtual std::vector<unsigned int> setNextConversion(unsigned int chan, unsigned int span) = 0;

  // Sends dummy signal and reads out previous conversion result
  virtual std::vector<unsigned int> readPreviousConversion() = 0;
};

#endif // ADCDevice_H
