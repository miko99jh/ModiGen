model Capacitor
 extends ModelicaByExample.Components.Electrical.DryApproach.TwoPin;

  parameter Real C(unit="F") "Capacitance of the capacitor";

equation
  C * der(v) = i;
end Capacitor;