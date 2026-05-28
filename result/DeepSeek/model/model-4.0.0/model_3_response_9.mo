block SignalRanker extends Modelica.Blocks.Interfaces.MIMO;
  parameter Integer nin=Modelica.Blocks.Interfaces.nin;
  parameter Integer nout=Modelica.Blocks.Interfaces.nout;
  input Real u[:,nin];
  output Real y[:,nout];
equation
  assert(nin==nout, "Number of inputs and outputs must be equal");
  y = Modelica.Math.Vectors.sort(u, "ascending", false);
end SignalRanker;