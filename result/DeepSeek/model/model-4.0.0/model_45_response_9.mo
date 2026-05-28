block ExtractSignal
  extends Modelica.ComplexBlocks.Interfaces.ComplexMIMO;
  parameter Integer extract[:];
  output Modelica.ComplexBlocks.Interfaces.ComplexReal y[:];

equation
  assert(size(extract, 1) == nout,
    "The size of the extract parameter must match the number of outputs");
  for i in 1:nout loop
    y[i] = u[extract[i]];
  end for;
end ExtractSignal;