block ExtractSignal
model ExtractSignal
  extends Modelica.ComplexBlocks.Interfaces.ComplexMIMO;
  parameter Integer extract[:];
  Modelica.ComplexBlocks.Interfaces.ComplexMIMO u;
  Modelica.ComplexBlocks.Interfaces.ComplexMIMO y[size(extract, 1)];
equation
  for i in 1:size(extract, 1) loop
    y[i] = u[extract[i]];
  end for;
end ExtractSignal;