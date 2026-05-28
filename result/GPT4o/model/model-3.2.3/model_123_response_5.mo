block Feedback
 import ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput;
  import ModelicaByExample.Components.BlockDiagrams.Interfaces.RealOutput;

  RealInput u1 "First input signal";
  RealInput u2 "Second input signal";
  RealOutput y "Output signal (u1 - u2)";

equation
  y = u1 - u2;
end Feedback;