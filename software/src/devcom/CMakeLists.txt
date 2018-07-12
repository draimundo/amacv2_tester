SET(SrcFiles DeviceCom.cpp
  UIOCom.cpp
  SPICom.cpp
  EndeavourCom.cpp
  EndeavourRaw.cpp

  FreqMeas.cpp

  ComIOException.cpp
  EndeavourComException.cpp

  ClimateSensor.cpp
  BME280.cpp

  DACDevice.cpp
  LTC2666.cpp
	
	AD5160.cpp
)

ADD_LIBRARY(devcom SHARED ${SrcFiles}) 
INSTALL(TARGETS devcom LIBRARY DESTINATION lib)
SET_TARGET_PROPERTIES(devcom PROPERTIES
  SOVERSION ${amac_VERSION_MAJOR}
  VERSION ${amac_VERSION_MAJOR}.${amac_VERSION_MINOR}
  )
