block ExtractSignal
 extends Modelica.ComplexBlocks.Interfaces.ComplexMIMO;

  parameter Integer extract[nout] "Indices of input signals to extract";

protected 
  // Ensure that the extract indices are within the valid range
  parameter Boolean validIndices = all(extract >= 1 and extract <= nin) "Check if extract indices are valid";

equation 
  // Check if the extract indices are valid
  assert(validIndices, "Extract indices must be within the range of input signals");

  // Map the specified input signals to the outputs
  for i in 1:nout loop
    y[i] = u[extract[i]];
  end for;

end ExtractSignal;