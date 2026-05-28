model Capacitor
 extends ModelicaByExample.Components.Electrical.DryApproach.TwoPin;

  parameter Real C(unit="F") "Capacitance in Farads";

equation
  C * der(v) = i;
end Capacitor;