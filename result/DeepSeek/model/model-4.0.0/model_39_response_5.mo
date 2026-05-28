block AssignClockVectorized
  extends Modelica.Blocks.Interfaces.RealInput,
         Modelica.Blocks.Interfaces.RealOutput,
         Modelica.Clocked.ClockSignals.Interfaces.ClockInput;
  parameter Integer n(min=1)=1 "Size of input signal vector u (= size of output signal vector y)";
  input Real u[n] "A vector of Real input signals";
  output Real y[n] "A vector of Real output signals";
equation
  when clock then
    y = u;
  end when;
end AssignClockVectorized;