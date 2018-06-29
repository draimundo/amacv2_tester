#ifndef FREQ_MEAS_H
#define FREQ_MEAS_H

#include <memory>
#include <cstdint>

#include "UIOCom.h"

enum class FreqMeasId{
    // TODO replace id
};

class FreqMeas{
public:
	FreqMeas(std::shared_ptr<DeviceCom> dev, uint8_t id, uint32_t ts_cnt = 10000);
	virtual ~FreqMeas();
	void reset(bool active = true);
	void freeze(bool active = true);
	void start();
	void set_ts_cnt(uint32_t ts_cnt = 10000);
	void read();
	uint32_t get_ts_cnt();

	const uint16_t& hi_n = m_hi_n;
	const bool& hi_flg = m_hi_flg;
	const uint16_t& lo_n = m_lo_n;
	const bool& lo_flg = m_lo_flg;
	const uint32_t& hi_t = m_hi_t;
	const bool& t_flg = m_t_flg;

private:
	uint8_t m_id;
	uint16_t m_hi_n;
	bool m_hi_flg;
	uint16_t m_lo_n;
	bool m_lo_flg;
	uint32_t m_hi_t;
	bool m_t_flg;

	std::shared_ptr<DeviceCom> m_dev;
};

#endif //FREQ_MEAS_H
