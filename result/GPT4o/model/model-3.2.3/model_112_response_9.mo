model StepVoltage
 extends ModelicaByExample.Components.Electrical.DryApproach.TwoPin;

  parameter Modelica.SIunits.Voltage V0 = 0 "Initial voltage";
  parameter Modelica.SIunits.Voltage Vf = 1 "Final voltage";
  parameter Modelica.SIunits.Time stepTime = 1 "Time at which voltage steps from V0 to Vf";

  Modelica.SIunits.Voltage v "Voltage across the component";

equation
  // Voltage output switches from V0 to Vf at stepTime
  v = if time < stepTime then V0 else Vf;

  // Connect the voltage to the TwoPin interface
  p.v = v;
  n.v = 0; // Assuming the negative pin is grounded

end StepVoltage;