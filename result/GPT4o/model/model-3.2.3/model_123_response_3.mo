block Feedback
 // Import necessary interfaces
  extends Modelica.Blocks.Interfaces.BlockIcon;

  // Inputs
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput u1 "First input signal";
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput u2 "Second input signal";

  // Output
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealOutput y "Output signal";

equation
  // Output is the difference between the inputs
  y = u1 - u2;
end Feedback;