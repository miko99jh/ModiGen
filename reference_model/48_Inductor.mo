model Inductor "Ideal linear electrical inductor"
  extends Modelica.Electrical.Analog.Interfaces.OnePort(i(start=0));
  parameter Modelica.Units.SI.Inductance L(start=1) "Inductance";

equation
  L*der(i) = v;
end Inductor;
