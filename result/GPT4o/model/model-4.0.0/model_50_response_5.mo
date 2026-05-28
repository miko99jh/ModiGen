model AD_DA_conversion
 // Import necessary Modelica libraries
  import Modelica.Electrical.Analog;
  import Modelica.Electrical.Digital;
  import Modelica.Electrical.Analog.Basic;
  import Modelica.Electrical.Analog.Sources;
  import Modelica.Electrical.Analog.Ideal;
  import Modelica.Electrical.Digital.Interfaces;
  import Modelica.Electrical.Digital.Sources;
  import Modelica.Electrical.Analog.Interfaces;

  // Components
  Ideal.AD_Converter aD_Converter(
    N=7, 
    Rin=1000000, 
    VRefLow=0, 
    VRefHigh=10) "Analog to Digital Converter";

  Digital.Sources.Pulse pulse(
    pulse=Interfaces.Logic.'1', 
    quiet=Interfaces.Logic.'0', 
    nperiod=-1, 
    width=1, 
    period=0.001, 
    startTime=0) "Digital pulse generator";

  Ideal.DA_Converter dA_Converter(
    N=7, 
    Vref=10) "Digital to Analog Converter";

  Sources.SineVoltage sineVoltage(
    V=5, 
    f=10, 
    offset=5) "Sine wave voltage source";

  Basic.Resistor resistor(R=1) "Resistor for error measurement";

  Analog.Interfaces.Ground ground "Ground reference";

equation
  // Connect pulse output to trigger inputs
  connect(pulse.y, aD_Converter.trig);
  connect(pulse.y, dA_Converter.trig);

  // Connect sine wave voltage to AD converter
  connect(sineVoltage.p, aD_Converter.p);
  connect(sineVoltage.n, aD_Converter.n);

  // Connect digital output of AD converter to DA converter
  connect(aD_Converter.y, dA_Converter.x);

  // Connect ground
  connect(sineVoltage.n, ground.p);
  connect(dA_Converter.n, ground.p);

  // Connect resistor for error measurement
  connect(sineVoltage.p, resistor.p);
  connect(dA_Converter.p, resistor.n);

end AD_DA_conversion;