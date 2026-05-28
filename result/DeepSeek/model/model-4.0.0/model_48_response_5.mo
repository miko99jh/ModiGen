model Inductor
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter Modelica.Units.SI.Inductance L=1 "Inductance";
  Modelica.SIunits.Current i_start(start=0) "Initial current";
equation 
  v = L * der(i);
end Inductor;