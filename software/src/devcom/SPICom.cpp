#include "SPICom.h"

#include "ComIOException.h"

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>

#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))

SPICom::SPICom(const std::string& device)
{
  m_fd = open(device.c_str(), O_RDWR);
  if(m_fd < 0)
    throw ComIOException("SPICom cannot open "+device+": "+strerror(errno));
}

SPICom::~SPICom()
{
  close(m_fd);
}


void SPICom::setMode(uint32_t mode)
{
  int ret;

  ret = ioctl(m_fd, SPI_IOC_WR_MODE32, &mode);
  if (ret == -1)
    throw ComIOException("SPICom can't set mode (write)");

  ret = ioctl(m_fd, SPI_IOC_RD_MODE32, &mode);
  if (ret == -1)
    throw ComIOException("SPICom can't set mode (read)");
}

void SPICom::setBitsPerWord(uint8_t bits)
{
  int ret;

  ret = ioctl(m_fd, SPI_IOC_WR_BITS_PER_WORD, &bits);
  if (ret == -1)
    throw ComIOException("SPICom can't set bits per word (write)");

  ret = ioctl(m_fd, SPI_IOC_RD_BITS_PER_WORD, &bits);
  if (ret == -1)
    throw ComIOException("SPICom can't set bits per word (read)");
}

void SPICom::setMaxSpeed(uint32_t speed)
{
  int ret;

  ret = ioctl(m_fd, SPI_IOC_WR_MAX_SPEED_HZ, &speed);
  if (ret == -1)
    throw ComIOException("SPICom can't set max speed (write)");

  ret = ioctl(m_fd, SPI_IOC_RD_MAX_SPEED_HZ, &speed);
  if (ret == -1)
    throw ComIOException("SPICom can't set max speed (read)");
}

void SPICom::write_reg(unsigned int address, unsigned int data)
{
  int ret;

  uint8_t tx[] = {
    (uint8_t)(address&0xFF), (uint8_t)(data&0xFF)
  };
  uint8_t rx[ARRAY_SIZE(tx)] = {0, };
  struct spi_ioc_transfer tr = {
    .tx_buf = (unsigned long)tx,
    .rx_buf = (unsigned long)rx,
    .len = ARRAY_SIZE(tx),
  };

  ret = ioctl(m_fd, SPI_IOC_MESSAGE(1), &tr);
  if (ret < 1)
    throw ComIOException("SPICom transfer error");
}

void SPICom::write_reg(std::vector<unsigned int> data_vec)
{
  int ret;

  uint8_t tx[data_vec.size()] = {0, };
  
  for(int vec_index = 0; vec_index < data_vec.size(); ++vec_index){
    unsigned int data = data_vec.at(vec_index);
    tx[vec_index] = (uint8_t)(data&0xFF);
  }
  
  uint8_t rx[ARRAY_SIZE(tx)] = {0, };
  struct spi_ioc_transfer tr = {
    .tx_buf = (unsigned long)tx,
    .rx_buf = (unsigned long)rx,
    .len = ARRAY_SIZE(tx),
  };

  ret = ioctl(m_fd, SPI_IOC_MESSAGE(1), &tr);
  if (ret < 1)
    throw ComIOException("SPICom transfer error");
}

void SPICom::write_data(uint8_t data)
{
	int ret;
	uint8_t tx[] = {(uint8_t)(data&0xFF)};
	uint8_t rx[ARRAY_SIZE(tx)] = {0, };
	struct spi_ioc_transfer tr = {
		.tx_buf = (unsigned long)tx,
		.rx_buf = (unsigned long)rx,
		.len = ARRAY_SIZE(tx),
	};
	
	ret = ioctl(m_fd, SPI_IOC_MESSAGE(1), &tr);
	if (ret < 1)
		throw ComIOException("SPICom transfer error");
}

unsigned int SPICom::read_reg(unsigned int address)
{
  int ret;

  uint8_t tx[] = {
    (uint8_t)(address&0xFF), 0x00
  };
  uint8_t rx[ARRAY_SIZE(tx)] = {0, };
  struct spi_ioc_transfer tr = {
    .tx_buf = (unsigned long)tx,
    .rx_buf = (unsigned long)rx,
    .len = ARRAY_SIZE(tx),
  };

  ret = ioctl(m_fd, SPI_IOC_MESSAGE(1), &tr);
  if (ret < 1)
    throw ComIOException("SPICom transfer error");

  return rx[1];
}

void SPICom::read_reg(unsigned int address, uint8_t* data, unsigned int len)
{
  int ret;

  uint8_t tx[len+1] = {0x0};
  tx[0]=(uint8_t)(address&0xFF);
  uint8_t rx[ARRAY_SIZE(tx)] = {0, };
  struct spi_ioc_transfer tr = {
    .tx_buf = (unsigned long)tx,
    .rx_buf = (unsigned long)rx,
    .len = ARRAY_SIZE(tx),
  };

  ret = ioctl(m_fd, SPI_IOC_MESSAGE(1), &tr);
  if (ret < 1)
    throw ComIOException("SPICom transfer error");

  for(uint i=1;i<len+1;i++)
    data[i-1]=rx[i];
}
