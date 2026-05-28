model StepVoltage
  extends ModelicaByExample.Components.Electrical.DryApproach.TwoPin;
  parameter Modelica.SIunits.Voltage V0 "Initial voltage";
  parameter Modelica.SIunits.Voltage Vf "Final voltage";
  parameter Modelica.SIunits.Time stepTime "Time at which voltage switches";
  Modelica.SIunits.Voltage v;
equation
  v = if time < stepTime then V0 else Vf;
end StepVoltage;