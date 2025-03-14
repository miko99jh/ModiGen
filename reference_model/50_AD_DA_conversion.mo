model AD_DA_conversion "Conversion circuit"
  extends Modelica.Icons.Example;
  parameter Integer N=7 "Digital signal width";
  Modelica.Electrical.Analog.Ideal.AD_Converter aD_Converter(N=N,
    Rin=1000000,
    VRefLow=0,
    VRefHigh=10);
  Modelica.Electrical.Digital.Sources.Pulse pulse(
    pulse=Modelica.Electrical.Digital.Interfaces.Logic.'1',
    quiet=Modelica.Electrical.Digital.Interfaces.Logic.'0',
    nperiod=-1,
    width=1,
    period=0.001,
    startTime=0);
  Modelica.Electrical.Analog.Ideal.DA_Converter dA_Converter(N=N, Vref=10);
  Modelica.Electrical.Analog.Basic.Ground ground;
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(
    V=5,
    f=10,
    offset=5);
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=1);
equation
  connect(pulse.y, aD_Converter.trig);
  connect(sineVoltage.p, aD_Converter.p);
  connect(sineVoltage.n, aD_Converter.n);
  connect(ground.p, sineVoltage.n);
  connect(sineVoltage.p, resistor.p);
  connect(dA_Converter.trig, pulse.y);
  connect(aD_Converter.y, dA_Converter.x);
  connect(dA_Converter.p, resistor.n);
  connect(dA_Converter.n, ground.p);
end AD_DA_conversion;
