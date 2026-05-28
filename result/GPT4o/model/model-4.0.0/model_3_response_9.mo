block SignalRanker
 extends Modelica.Blocks.Interfaces.MIMO(nin=2, nout=2);

  parameter Integer nin = 2 "Number of inputs";
  parameter Integer nout = nin "Number of outputs (must match number of inputs)";

protected
  Real sortedSignals[nin] "Sorted signals in descending order";

equation
  // Sort the input signals in descending order
  sortedSignals = Modelica.Math.Vectors.sort(u, ascending=false);

  // Assign sorted signals to the output
  y = sortedSignals;
end SignalRanker;