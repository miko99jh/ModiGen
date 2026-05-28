block SignalRanker
 extends Modelica.Blocks.Interfaces.MIMO;

protected 
  Real sortedU[size(u, 1)];

equation 
  // Ensure the number of outputs matches the number of inputs
  assert(nout == nin, "Number of outputs must match number of inputs.");

  // Sort the input vector in descending order
  sortedU = Modelica.Math.Vectors.sort(u, ascending=false);

  // Assign the sorted values to the output
  y = sortedU;

end SignalRanker;