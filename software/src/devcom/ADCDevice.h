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

};

#endif // ADCDevice_H
