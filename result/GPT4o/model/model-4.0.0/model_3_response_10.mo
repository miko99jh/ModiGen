block SignalRanker
 extends Modelica.Blocks.Interfaces.MIMO;

  // Ensure the number of outputs matches the number of inputs
  parameter Integer nin = 1 "Number of inputs and outputs";
  parameter Integer nout = nin "Number of outputs";

  // Input and output connectors
  input Real u[nin] "Input vector";
  output Real y[nout] "Output vector";

protected 
  Real sortedU[nin];

equation 
  // Sort the input vector in descending order
  sortedU = Modelica.Math.Vectors.sort(u, ascending=false);

  // Assign sorted values to output
  for i in 1:nout loop
    y[i] = sortedU[i];
  end for;

end SignalRanker;