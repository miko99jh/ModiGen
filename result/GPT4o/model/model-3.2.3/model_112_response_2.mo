model StepVoltage
 extends ModelicaByExample.Components.Electrical.DryApproach.TwoPin;

  parameter Modelica.SIunits.Voltage V0 = 0 "Initial voltage";
  parameter Modelica.SIunits.Voltage Vf = 1 "Final voltage";
  parameter Modelica.SIunits.Time stepTime = 1 "Time at which voltage steps from V0 to Vf";

  Modelica.SIunits.Voltage v;

equation
  if time < stepTime then
    v = V0;
  else
    v = Vf;
  end if;

  p.v = v;
  n.v = 0;
end StepVoltage;