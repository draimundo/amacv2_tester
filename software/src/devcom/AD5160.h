#ifndef AD5160_H
#define AD5160_H

#include "SPICom.h"

#include <memory>


class AD5160{
public:
	AD5160(std::shared_ptr<SPICom> spi);
	~AD5160();
	
	void setResistance(uint8_t regVal);
	uint8_t getResistance();

private:
	std::shared_ptr<SPICom> m_spi;

	uint8_t m_regVal;
	
	// To limit the resistance range
	uint8_t m_regMin = 0x00;
	uint8_t m_regMax = 0xFF;
};
#endif //AD5160_H