block ExtractSignal
model ExtractSignal
  extends Modelica.ComplexBlocks.Interfaces.ComplexMIMO;
  parameter Integer extract[:];
  output Modelica.ComplexBlocks.Interfaces.ComplexMIMO y[size(extract, 1)];

protected 
  Integer nout=size(extract, 1);

algorithm 
  for i in 1:nout loop
    y[i].u = u[extract[i]];
  end for;
end ExtractSignal;