model Capacitor
  extends ModelicaByExample.Components.Electrical.DryApproach.TwoPin;
  parameter Modelica.SIunits.Capacitance C "Capacitance";
equation 
  C*der(v) = i;
end Capacitor;