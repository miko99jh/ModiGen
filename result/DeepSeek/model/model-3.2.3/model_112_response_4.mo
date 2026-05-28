model StepVoltage
  extends ModelicaByExample.Components.Electrical.DryApproach.TwoPin;
  parameter Modelica.SIunits.Voltage V0;
  parameter Modelica.SIunits.Voltage Vf;
  parameter Modelica.SIunits.Time stepTime;
  Modelica.SIunits.Voltage v;
equation
  v = if time < stepTime then V0 else Vf;
end StepVoltage;