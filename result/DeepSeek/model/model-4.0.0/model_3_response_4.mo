block SignalRanker extends Modelica.Blocks.Interfaces.MIMO;
  parameter Integer nin=Modelica.Blocks.Interfaces.nin;
  parameter Integer nout=Modelica.Blocks.Interfaces.nout;
  Modelica.Blocks.Interfaces.RealInput u[nin];
  Modelica.Blocks.Interfaces.RealOutput y[nout];
equation
  assert(nin == nout, "The number of inputs and outputs must be equal.");
  y = Modelica.Math.Vectors.sort(u, "descending");
end SignalRanker;