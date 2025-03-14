block VfController "Voltage-Frequency-Controller"
  import Modelica.Constants.pi;
  extends Modelica.Blocks.Interfaces.SIMO(u(unit="Hz"), final nout=m);
  parameter Integer m=3 "Number of phases";
  parameter Modelica.Units.SI.Angle orientation[m]=-
  Modelica.Electrical.Polyphase.Functions.symmetricOrientation(m)
 "Orientation of phases";
  parameter Modelica.Units.SI.Voltage VNominal "Nominal RMS voltage per phase";
  parameter Modelica.Units.SI.Frequency fNominal "Nominal frequency";
  parameter Modelica.Units.SI.Angle BasePhase=0 "Common phase shift";
  parameter Boolean EconomyMode=false "Economy mode: voltage quadratic dependent on frequency" ;
  output Modelica.Units.SI.Angle x(start=0, fixed=true) "Integrator state";
  output Modelica.Units.SI.Voltage amplitude;
protected
  parameter Integer pow=if EconomyMode then 2 else 1;
equation
  amplitude = sqrt(2)*VNominal*(if abs(u) < fNominal then (abs(u)/fNominal)^pow else 1);
  der(x) = 2*pi*u;
  y = amplitude*sin(fill(x + BasePhase, m) + orientation);
end VfController;
