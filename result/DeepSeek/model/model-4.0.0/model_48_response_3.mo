model Inductor
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter Modelica.Units.SI.Inductance L = 1 "Inductance";
  Modelica.SIunits.Current i(start = 0) "Current";
equation
  // equation relating the inductance to the time derivative of the current
  L * der(i) = v;
end Inductor;