block ExtractSignal
  extends Modelica.ComplexBlocks.Interfaces.ComplexMIMO;
  parameter Integer extract[nout];
  output ComplexOutput y[nout];

equation 
  for i in 1:nout loop
    y[i] = u[extract[i]];
  end for;
end ExtractSignal;