block AssignClock
 // Define the clocked Integer input signal
  Modelica.Blocks.Interfaces.IntegerInput u;
  
  // Define the clocked Integer output signal
  Modelica.Blocks.Interfaces.IntegerOutput y;
  
  // Define the clock input for the model
  Modelica.Clocked.ClockSignals.Interfaces.ClockInput clock;
  
equation
  // Use a when clause triggered by the clock signal to assign the input to the output
  when ClockedSample(clock) then
    y = u;
  end when;
end AssignClock;