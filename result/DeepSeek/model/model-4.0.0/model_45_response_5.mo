block ExtractSignal
model ExtractSignal
  extends Modelica.ComplexBlocks.Interfaces.ComplexMIMO;
  parameter Integer extract[nout];
  Modelica.ComplexBlocks.Interfaces.ComplexMIMO u;
  Modelica.ComplexBlocks.Interfaces.ComplexMIMO y[nout];
equation
  for i in 1:nout loop
    y[i] = u[extract[i]];
  end for;
end ExtractSignal;