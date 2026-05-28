block ExtractSignal
 extends Modelica.ComplexBlocks.Interfaces.ComplexMIMO;

  parameter Integer extract[nout] "Indices of input signals to be extracted";

equation
  // Iterate over the range of output signals
  for i in 1:nout loop
    // Assign each specified input signal to the corresponding output
    y[i] = u[extract[i]];
  end for;
end ExtractSignal;