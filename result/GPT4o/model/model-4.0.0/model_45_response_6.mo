block ExtractSignal
 extends Modelica.ComplexBlocks.Interfaces.ComplexMIMO;

  parameter Integer extract[nout] "Indices of input signals to be extracted";

equation
  for i in 1:nout loop
    y[i] = u[extract[i]];
  end for;
end ExtractSignal;