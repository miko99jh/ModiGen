block SignalRanker extends Modelica.Blocks.Interfaces.MIMO(nin=nin, nout=nin);
  input Real u[:,nin] "Input signals";
  output Real y[:,nin] "Output signals";
algorithm 
  y := Modelica.Math.Vectors.sort(u, 'ascending' = false);
end SignalRanker;