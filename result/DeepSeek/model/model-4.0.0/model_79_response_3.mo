block VfController extends Modelica.Blocks.Interfaces.SIMO(final nout=m, unit="Hz")
  parameter Integer m=3 "Number of phases";
  parameter Modelica.Units.SI.Angle orientation[m] 
    = -Modelica.Electrical.Polyphase.Functions.symmetricOrientation(m) 
    "Orientation of phases";
  parameter Modelica.Units.SI.Voltage VNominal "Nominal RMS voltage per phase";
  parameter Modelica.Units.SI.Frequency fNominal "Nominal frequency";
  parameter Modelica.Units.SI.Angle BasePhase=0 "Common phase shift";
  parameter Boolean EconomyMode=false "Economy mode";
  output Modelica.Units.SI.Angle x(start=0, fixed=true) "Integrator state";
  output Modelica.Units.SI.Voltage amplitude "Voltage amplitude";
  protected 
  Integer pow if EconomyMode then 2 else 1;
  equation 
  amplitude = if u < fNominal then VNominal * (u/fNominal)^pow else VNominal;
  der(x) = Modelica.Constants.pi * 2 * u "Phase integration";
  y = Modelica.Electrical.Polyphase.Variables.voltage(amplitude, orientation, x + BasePhase);
end VfController;