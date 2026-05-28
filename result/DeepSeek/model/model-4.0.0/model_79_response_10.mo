block VfController extends Modelica.Blocks.Interfaces.SIMO(final nout=m, unit="Hz");
  parameter Integer m=3;
  parameter Modelica.Units.SI.Angle orientation[m] = -Modelica.Electrical.Polyphase.Functions.symmetricOrientation(m);
  parameter Modelica.Units.SI.Voltage VNominal;
  parameter Modelica.Units.SI.Frequency fNominal;
  parameter Modelica.Units.SI.Angle BasePhase=0;
  parameter Boolean EconomyMode=false;
  output Modelica.Units.SI.Angle x(start=0, fixed=true);
  output Modelica.Units.SI.Voltage amplitude;
  protected 
  Integer pow if EconomyMode then 2 else 1;
  equation 
  amplitude = if u < fNominal then VNominal * (u/fNominal)^pow else VNominal;
  der(x) = Modelica.Units.SI.Frequency.convert(u, "rad/s");
  y = Modelica.Electrical.Polyphase.Variables.voltage(amplitude, x + BasePhase, orientation);
end VfController;