block SignalRanker extends Modelica.Blocks.Interfaces.MIMO
  parameter Integer nin=Modelica.Blocks.Interfaces.nin;
  parameter Integer nout=Modelica.Blocks.Interfaces.nout;
  input Real u[:,nin] "Input vector";
  output Real y[:,nout] "Output vector";
equation
  assert(nin == nout, "The number of inputs and outputs must be equal");
  y = Modelica.Math.Vectors.sort(u, "descending");
end SignalRanker;