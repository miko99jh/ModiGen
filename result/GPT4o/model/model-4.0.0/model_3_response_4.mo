block SignalRanker
 extends Modelica.Blocks.Interfaces.MIMO;

  parameter Integer nin = 1 "Number of inputs";
  parameter Integer nout = nin "Number of outputs";

  Modelica.Blocks.Interfaces.RealInput u[nin] "Input signals";
  Modelica.Blocks.Interfaces.RealOutput y[nout] "Output signals";

algorithm 
  // Sort the input vector in descending order
  y := Modelica.Math.Vectors.sort(u, ascending=false);
end SignalRanker;