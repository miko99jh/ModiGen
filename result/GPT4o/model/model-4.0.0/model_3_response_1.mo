block SignalRanker
 extends Modelica.Blocks.Interfaces.MIMO;

  parameter Integer nin = 1 "Number of input signals";
  parameter Integer nout = nin "Number of output signals";

  Modelica.Blocks.Interfaces.RealInput u[nin] "Input signals";
  Modelica.Blocks.Interfaces.RealOutput y[nout] "Output signals";

algorithm 
  // Sort the input vector in descending order
  y := Modelica.Math.Vectors.sort(u, ascending=false);
end SignalRanker;