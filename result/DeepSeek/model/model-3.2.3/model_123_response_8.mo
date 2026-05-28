block Feedback
  extends ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput;
  extends ModelicaByExample.Components.BlockDiagrams.Interfaces.RealOutput;

equation
  y = u1 - u2;
end Feedback;