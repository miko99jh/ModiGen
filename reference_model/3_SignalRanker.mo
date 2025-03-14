block SignalRanker1 "Ranks output signals such that y[i] >= y[i+1]"
   extends Modelica.Blocks.Interfaces.MIMO(final nout=nin);
equation
  y = Modelica.Math.Vectors.sort(u, ascending=false);
end SignalRanker1;
