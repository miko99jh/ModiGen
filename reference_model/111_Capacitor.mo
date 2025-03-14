model Capacitor "A DRY capacitor model"
  parameter Modelica.SIunits.Capacitance C;
  extends ModelicaByExample.Components.Electrical.DryApproach.TwoPin;
equation
  C*der(v) = i;
end Capacitor;
