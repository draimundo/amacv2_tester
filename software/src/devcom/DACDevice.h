#ifndef DACDevice_H
#define DACDevice_H

#include <vector>

class DACDevice
{
public:
  DACDevice();
  virtual ~DACDevice();

  virtual void init() = 0;
  virtual void reset() = 0;

  virtual void writeUpdateAll(unsigned int counts) = 0;
  virtual void writeUpdateChan(unsigned int chan, unsigned int counts) = 0;
  virtual void powerDownAll() = 0;
  virtual void powerDownChan(unsigned int chan) = 0;
  virtual void changeSpanAll(unsigned int span) = 0;
  virtual void changeSpanChan(unsigned int chan, unsigned int span) = 0;
  virtual void pointMuxAtChan(unsigned int chan) = 0;
  virtual void disableMux() = 0;
};

#endif // DACDevice_H
