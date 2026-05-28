model Damper
  extends ModelicaByExample.Components.Rotational.Interfaces.Compliant;
  parameter Modelica.SIunits.RotationalDampingConstant d "Rotational damping constant";
equation
  tau = d * der(phi_rel);
end Damper;