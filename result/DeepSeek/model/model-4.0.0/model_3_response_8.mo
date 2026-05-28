block SignalRanker extends Modelica.Blocks.Interfaces.MIMO;
  parameter Integer nin=size(u, 2);
  parameter Integer nout=nin;
  output Real y[:,nout] "Output signals ranked in descending order";
equation
  y = Modelica.Math.Vectors.sort(u, "descending");
end SignalRanker;