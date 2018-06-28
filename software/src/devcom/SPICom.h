#ifndef SPICOM_H
#define SPICOM_H

#include <string>

#include <linux/spi/spidev.h>

#include "DeviceCom.h"

class SPICom : public DeviceCom
{
public:
  SPICom(const std::string& device);
  virtual ~SPICom();

  void setMode(uint32_t mode);
  void setBitsPerWord(uint8_t bits);
  void setMaxSpeed(uint32_t speed);
  
  virtual void write_reg(unsigned int address, unsigned int data);
  virtual unsigned int read_reg(unsigned int address);
  virtual void read_reg(unsigned int address, uint8_t* data, unsigned int len);

private:
  int m_fd;
};

#endif // UICOM_H
