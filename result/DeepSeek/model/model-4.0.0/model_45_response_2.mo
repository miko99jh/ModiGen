block ExtractSignal
  extends Modelica.ComplexBlocks.Interfaces.ComplexMIMO;
  parameter Integer extract[:];
  output ComplexOutput y[:] "Output signals";

equation
  assert(size(extract, 1) == nout, "The size of extract parameter must match the number of output signals");

  for i in 1:nout loop
    y[i] = u[extract[i]];
  end for;
end ExtractSignal;