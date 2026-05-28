model StepVoltage
 extends ModelicaByExample.Components.Electrical.DryApproach.TwoPin;

  parameter Modelica.SIunits.Voltage V0 = 0 "Initial voltage";
  parameter Modelica.SIunits.Voltage Vf = 1 "Final voltage";
  parameter Modelica.SIunits.Time stepTime = 1 "Time at which the voltage steps from V0 to Vf";

protected 
  Modelica.Blocks.Sources.Step stepSource(
    height = Vf - V0,
    offset = V0,
    startTime = stepTime) "Step source to generate the voltage step";

equation 
  v = stepSource.y;
  i = 0; // Ideal voltage source has no internal current

end StepVoltage;