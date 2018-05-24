Measuring On-board Temperature

AMACv2 Internal Temperature:

The AMAC has an internal diode based temperature measurement 
(schematics available on p2 of 
https://svnweb.cern.ch/cern/wsvn/itkstrasic/AMACv2/trunk/doc/AMACv2_Schematics1.0a.pdf).
The Autonomous Monitor digitized value of the diode voltage can be
read in register 12, bits [9:0].

DUT Board Temperature:

The AMAC DUT board has an Amphenol NHQM103B375T10 NTC (datasheet in this directory) 
to measure temperature close to the chip. The NTC is set up in 4-wire configuration 
(2 current excitation wires and 2 voltage measurement wires). A 6.81k resistor sets 
an LM334 (datasheet in this directory) current source on the Active board to ~9.4uA. 
This will develop a voltage across the NTC of ~447mV at -10C, down to ~94mV at room 
temperature (+25C). This voltage can be measured with ADC1, ch0 on the Active board.
Resistance can be worked out from this voltage measurement, and the temperature can 
be found by:
-solving for ln(R) = A + B/T + C/T^2 + D/T^3, where A,B,C,D are found in the 
manufacturer's R/T curve data (Excel file in this directory).
-looking up the resistance value from the R/T curve data

Temperature Control for Radiation Testing:

An additional NTC is included on the DUT board, with a screw terminal connector 
on the Carrier board and Active board. This can be used to connect to an external
temperature controller box for a Peltier junction mounted to the DUT board.
A second spare screw terminal connection is supplied on the Carrier board to connect
to the Peltier plate NTC below the DUT board. These NTC wires are also available at the 
Active board.