block SignalRanker
 extends Modelica.Blocks.Interfaces.MIMO;

  // Ensure the number of outputs matches the number of inputs
  parameter Integer nin = 1 "Number of inputs";
  parameter Integer nout = nin "Number of outputs";

protected 
  Real sortedU[nin];

equation 
  // Sort the input vector in descending order
  sortedU = Modelica.Math.Vectors.sort(u, ascending=false);

  // Assign the sorted vector to the output
  y = sortedU;

  // Ensure the number of inputs and outputs are the same
  assert(nin == nout, "The number of inputs must equal the number of outputs.");

end SignalRanker;