block SignalRanker
 extends Modelica.Blocks.Interfaces.MIMO(nin=2, nout=2);

  // Parameters
  parameter Integer nin = 2 "Number of input signals";
  parameter Integer nout = nin "Number of output signals";

  // Inputs
  input Real u[nin] "Input signals";

  // Outputs
  output Real y[nout] "Output signals sorted in descending order";

algorithm
  // Sort the input signals in descending order
  y := Modelica.Math.Vectors.sort(v=u, ascending=false);
end SignalRanker;