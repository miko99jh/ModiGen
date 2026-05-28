block ExtractSignal
  extends Modelica.ComplexBlocks.Interfaces.ComplexMIMO;
  parameter Integer extract[:];
  output Modelica.ComplexBlocks.Interfaces.ComplexInput y[:] 
    "Output signals";

equation 
  assert(size(extract, 1) == nout, "Size of extract must match nout");

  for i in 1:nout loop
    y[i] = u[extract[i]];
  end for;
end ExtractSignal;