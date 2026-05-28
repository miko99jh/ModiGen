block ExtractSignal
model ExtractSignal "Extract specific signals from an input signal vector"
  extends Modelica.ComplexBlocks.Interfaces.ComplexMIMO;
  parameter Integer extract[:] "Indices of the input vector to be extracted";
  Modelica.ComplexBlocks.Interfaces.ComplexMIMO u "Input signals";
  Modelica.ComplexBlocks.Interfaces.ComplexMIMO y[size(extract, 1)] "Output signals";

equation 
  for i in 1:size(extract, 1) loop
    y[i] = u[extract[i]];
  end for;
end ExtractSignal;