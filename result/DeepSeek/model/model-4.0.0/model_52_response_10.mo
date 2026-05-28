model ShowSaturatingInductor
  parameter Modelica.Units.SI.Inductance Lzer=2;
  parameter Modelica.Units.SI.Inductance Lnom=1;
  parameter Modelica.Units.SI.Current Inom=1;
  parameter Modelica.Units.SI.Inductance Linf=0.5;
  parameter Modelica.Units.SI.Voltage U=1.25;
  parameter Modelica.Units.SI.Frequency f=1/(2*Modelica.Constants.pi);
  parameter Modelica.Units.SI.Angle phase=Modelica.Constants.pi/2;
  Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1(V=U, phase=phase, f=f);
  Modelica.Electrical.Analog.Basic.Ground Ground1;
  Modelica.Electrical.Analog.Basic.SaturatingInductor SaturatingInductance1(Lzer=Lzer, Lnom=Lnom, Inom=Inom, Linf=Linf, i(fixed=true));
  Modelica.Electrical.Analog.Basic.Inductor Inductance1(L=Lnom, i(fixed=true));
equation 
  connect(SineVoltage1.n, Ground1.p);
  connect(SineVoltage1.p, SaturatingInductance1.p);
  connect(SineVoltage1.p, Inductance1.p);
  connect(SineVoltage1.n, SaturatingInductance1.n);
  connect(SineVoltage1.n, Inductance1.n);
end ShowSaturatingInductor;