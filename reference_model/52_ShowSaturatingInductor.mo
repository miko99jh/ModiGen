model ShowSaturatingInductor  "Simple demo to show behaviour of SaturatingInductor component"
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.Inductance Lzer=2 "Inductance near current=0";
  parameter Modelica.Units.SI.Inductance Lnom=1 "Nominal inductance at Nominal current";
  parameter Modelica.Units.SI.Current Inom=1 "Nominal current";
  parameter Modelica.Units.SI.Inductance Linf=0.5 "Inductance at large currents";
  parameter Modelica.Units.SI.Voltage U=1.25 "Source voltage (peak)";
  parameter Modelica.Units.SI.Frequency f=1/(2*Modelica.Constants.pi) "Source frequency";
  parameter Modelica.Units.SI.Angle phase=Modelica.Constants.pi/2 "Source voltage phase shift";

  Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1(
   V=U,
   phase=phase,
   f=f);
  Modelica.Electrical.Analog.Basic.Ground Ground1;
  Modelica.Electrical.Analog.Basic.SaturatingInductor SaturatingInductance1(
   Lzer=Lzer,
   Lnom=Lnom,
   Inom=Inom,
   Linf=Linf,
   i(fixed=true));
  Modelica.Electrical.Analog.Basic.Inductor Inductance1(L=Lnom, i(fixed=true));
  
equation
  connect(SineVoltage1.n, Ground1.p);
  connect(SineVoltage1.n, SaturatingInductance1.n);
  connect(SaturatingInductance1.p, SineVoltage1.p);
  connect(Inductance1.p, SineVoltage1.p);
  connect(Inductance1.n, SineVoltage1.n);
end ShowSaturatingInductor;
