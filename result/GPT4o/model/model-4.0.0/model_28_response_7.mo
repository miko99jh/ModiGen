block ConjunctiveClock
 extends Modelica.Clocked.ClockSignals.Clocks.Logical.PartialLogicalClock;

  // Redeclare the combinator component to use a logical AND operation
  redeclare Modelica.Blocks.Logical.And combinator(n=numberOfInputClocks);

  // Parameters
  parameter Integer numberOfInputClocks(min=1) = 2 "Number of input clocks";

  // Inputs
  input Clock inputClocks[numberOfInputClocks] "Array of input clocks";

  // Outputs
  output Clock outputClock "Output clock that ticks when all input clocks have ticked";

equation
  // Connect the input clocks to the combinator
  for i in 1:numberOfInputClocks loop
    connect(inputClocks[i], combinator.u[i]);
  end for;

  // Connect the combinator output to the output clock
  connect(combinator.y, outputClock);
end ConjunctiveClock;