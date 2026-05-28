model AD_DA_conversion
 // Import necessary Modelica libraries
  import Modelica.Electrical.Analog.Ideal.AD_Converter;
  import Modelica.Electrical.Analog.Ideal.DA_Converter;
  import Modelica.Electrical.Analog.Sources.SineVoltage;
  import Modelica.Electrical.Analog.Basic.Resistor;
  import Modelica.Electrical.Analog.Basic.Ground;
  import Modelica.Electrical.Digital.Sources.Pulse;

  // Components declaration
  AD_Converter aD_Converter(N=7, Rin=1000000, VRefLow=0, VRefHigh=10) "Analog to Digital Converter";
  DA_Converter dA_Converter(N=7, Vref=10) "Digital to Analog Converter";
  SineVoltage sineVoltage(V=5, f=10, offset=5) "Sine wave voltage source";
  Resistor resistor(R=1) "Resistor for error measurement";
  Ground ground "Ground reference";
  Pulse pulse(pulse=Modelica.Electrical.Digital.Interfaces.Logic.'1', 
              quiet=Modelica.Electrical.Digital.Interfaces.Logic.'0', 
              nperiod=-1, width=1, period=0.001, startTime=0) "Digital pulse generator";

equation
  // Connect pulse output to trigger inputs of converters
  connect(pulse.y, aD_Converter.trig);
  connect(pulse.y, dA_Converter.trig);

  // Connect sine wave voltage to AD converter
  connect(sineVoltage.p, aD_Converter.p);
  connect(sineVoltage.n, aD_Converter.n);

  // Connect digital output of AD converter to digital input of DA converter
  connect(aD_Converter.y, dA_Converter.x);

  // Ground connections
  connect(sineVoltage.n, ground.p);
  connect(dA_Converter.n, ground.p);

  // Connect resistor between original and reconstructed analog signals
  connect(sineVoltage.p, resistor.p);
  connect(dA_Converter.p, resistor.n);

end AD_DA_conversion;