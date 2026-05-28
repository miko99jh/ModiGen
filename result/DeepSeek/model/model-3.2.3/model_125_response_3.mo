model Damper
  extends ModelicaByExample.Components.Rotational.Interfaces.Compliant;
  parameter Modelica.SIunits.RotationalDampingConstant d;
equation 
  tau = d*der(phi_rel);
end Damper;