model AD_DA_conversion
 // Import necessary Modelica libraries
  import Modelica.Electrical.Analog;
  import Modelica.Electrical.Digital;
  import Modelica.Electrical.Analog.Basic.Resistor;
  import Modelica.Electrical.Analog.Sources.SineVoltage;
  import Modelica.Electrical.Analog.Ideal.AD_Converter;
  import Modelica.Electrical.Analog.Ideal.DA_Converter;
  import Modelica.Electrical.Digital.Sources.Pulse;
  import Modelica.Electrical.Analog.Basic.Ground;

  // Components
  AD_Converter aD_Converter(
    N=7,
    Rin=1000000,
    VRefLow=0,
    VRefHigh=10) "Analog to Digital Converter";

  DA_Converter dA_Converter(
    N=7,
    Vref=10) "Digital to Analog Converter";

  SineVoltage sineVoltage(
    V=5,
    f=10,
    offset=5) "Sine wave voltage source";

  Pulse pulse(
    pulse=Digital.Interfaces.Logic.'1',
    quiet=Digital.Interfaces.Logic.'0',
    nperiod=-1,
    width=1,
    period=0.001,
    startTime=0) "Digital pulse generator";

  Resistor resistor(R=1) "Resistor for error measurement";

  Ground ground "Ground reference";

equation
  // Connect the pulse output to the trigger inputs of the converters
  connect(pulse.y, aD_Converter.trig);
  connect(pulse.y, dA_Converter.trig);

  // Connect the sine wave voltage to the AD converter
  connect(sineVoltage.p, aD_Converter.p);
  connect(sineVoltage.n, aD_Converter.n);

  // Connect the digital output of the AD converter to the DA converter
  connect(aD_Converter.y, dA_Converter.x);

  // Ground connections
  connect(sineVoltage.n, ground.p);
  connect(dA_Converter.n, ground.p);

  // Connect the resistor between the original and reconstructed signals
  connect(sineVoltage.p, resistor.p);
  connect(dA_Converter.p, resistor.n);

end AD_DA_conversion;