block ExtractSignal1 "Extract signals from an input signal vector"
  extends Modelica.ComplexBlocks.Interfaces.ComplexMIMO;
  parameter Integer extract[nout]=1:nout "Extracting vector";

equation
  for i in 1:nout loop
    y[i] = u[extract[i]];
  end for;
  
end ExtractSignal1;
