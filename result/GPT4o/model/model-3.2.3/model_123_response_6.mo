block Feedback
 "Block that computes the difference between two inputs (u1 and u2) and outputs the result (y)"
  import ModelicaByExample.Components.BlockDiagrams.Interfaces;

  Interfaces.RealInput u1 "First input signal";
  Interfaces.RealInput u2 "Second input signal";
  Interfaces.RealOutput y "Output signal (difference between u1 and u2)";

equation
  y = u1 - u2;
end Feedback;