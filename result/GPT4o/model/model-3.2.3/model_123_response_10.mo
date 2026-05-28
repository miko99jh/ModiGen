block Feedback
 // Import necessary interfaces for inputs and outputs
  import ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput;
  import ModelicaByExample.Components.BlockDiagrams.Interfaces.RealOutput;

  // Define inputs
  RealInput u1 "First input signal";
  RealInput u2 "Second input signal";

  // Define output
  RealOutput y "Output signal representing the difference between u1 and u2";

equation
  // Equation for computing the output
  y = u1 - u2;
end Feedback;