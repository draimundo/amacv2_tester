#ifndef DEVICECOM_H
#define DEVICECOM_H

#include <vector>
#include <cstdint>

class DeviceCom{
public:
  DeviceCom();

	virtual void write_reg(unsigned int address, unsigned int data) = 0;
	virtual void write_reg(std::vector<unsigned int> data_vec) = 0;
	virtual void write_data(uint8_t data) = 0;

	virtual unsigned int read_reg(unsigned int address) = 0;
	virtual void read_reg(unsigned int address, uint8_t* data, unsigned int len) = 0;
	virtual void read_reg(std::vector<unsigned int> addresses, uint8_t* data, unsigned int len) = 0;
};

#endif // DEVICECOM_H
