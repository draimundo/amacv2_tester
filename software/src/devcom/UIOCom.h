#ifndef UIOCOM_H
#define UIOCOM_H

#include <string>

#include "DeviceCom.h"

class UIOCom : public DeviceCom
{
public:
  UIOCom(const std::string& device, unsigned int size);
  virtual ~UIOCom();

  virtual void write_reg(unsigned int address, unsigned int data);
  virtual unsigned int read_reg(unsigned int address);
	

	//implemented in DeviceCom
	virtual void write_reg(std::vector<unsigned int> data_vec){};
	virtual void write_data(uint8_t data){};

	virtual void read_reg(unsigned int address, uint8_t* data, unsigned int len){};
	virtual void read_reg(uint8_t* data_in, uint8_t* data_out, unsigned int len){};

private:
  unsigned int m_size;

  int m_fd;
  unsigned *m_ptr;
};

#endif // UICOM_H
