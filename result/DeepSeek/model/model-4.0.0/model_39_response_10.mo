block AssignClockVectorized
  extends Modelica.Blocks.Interfaces.RealInput[n],
         Modelica.Blocks.Interfaces.RealOutput[n],
         Modelica.Clocked.ClockSignals.Interfaces.ClockInput;
  parameter Integer n(min=1) = 1;
  input Real u[n];
  output Real y[n];
equation
  when clock then
    y = u;
  end when;
end AssignClockVectorized;