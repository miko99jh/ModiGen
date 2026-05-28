model Inductor
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter Modelica.Units.SI.Inductance L=1 "Inductance";
  Modelica.SIunits.Current i_start = 0 "Initial value of current";
equation
  L * der(i) = v;
  i = i_start;
end Inductor;