#ifndef CLIMATESENSOR_H
#define CLIMATESENSOR_H

class ClimateSensor
{
public:
  ClimateSensor();
  virtual ~ClimateSensor();

  virtual void init() =0;
  virtual void reset() =0;
  virtual float temperature() =0;
  virtual float humidity() =0;
  virtual float pressure() =0;
};

#endif // CLIMATESENSOR_H
