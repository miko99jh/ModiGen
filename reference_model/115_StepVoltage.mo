model StepVoltage "A DRY step voltage source"
  parameter Modelica.SIunits.Voltage V0;
  parameter Modelica.SIunits.Voltage Vf;
  parameter Modelica.SIunits.Time stepTime;
  extends ModelicaByExample.Components.Electrical.DryApproach.TwoPin;
equation
  v = if time>=stepTime then Vf else V0;
end StepVoltage;
