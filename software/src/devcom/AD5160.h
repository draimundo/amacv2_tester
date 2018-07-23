#ifndef AD5160_H
#define AD5160_H

#include "DeviceCom.h"

#include <memory>


class AD5160{
public:
	AD5160(std::shared_ptr<DeviceCom> dev);
	~AD5160();
	
	void setResistance(uint8_t regVal);
	uint8_t getResistance();

private:
	std::shared_ptr<DeviceCom> m_dev;

	uint8_t m_regVal;
	
	// To limit the resistance range
	uint8_t m_regMin = 0x00;
	uint8_t m_regMax = 0xFF;
};
#endif //AD5160_H