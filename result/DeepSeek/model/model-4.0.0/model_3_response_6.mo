block SignalRanker extends Modelica.Blocks.Interfaces.MIMO;
  parameter Integer nin=size(u, 2);
  parameter Integer nout=nin;
  parameter Integer[nin] rank=sort([1:nin], false);
  output Real y[:, nin](each final min=0, each final max=1) = 
    u[:, rank];
end SignalRanker;