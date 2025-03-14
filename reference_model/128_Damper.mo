model Damper1 "A rotational damper"
  parameter Modelica.SIunits.RotationalDampingConstant d;
  extends ModelicaByExample.Components.Rotational.Interfaces.Compliant;
equation
  tau = d*der(phi_rel) "Damping relationship";
end Damper1;
