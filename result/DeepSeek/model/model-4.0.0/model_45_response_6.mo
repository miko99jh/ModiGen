block ExtractSignal
  extends Modelica.ComplexBlocks.Interfaces.ComplexMIMO;
  parameter Integer extract[:];
  Modelica.ComplexBlocks.Interfaces.ComplexInput u;
  Modelica.ComplexBlocks.Interfaces.ComplexOutput y[size(extract, 1)];
algorithm 
  for i in 1:size(extract, 1) loop
    y[i] := u[extract[i]];
  end for;
end ExtractSignal;