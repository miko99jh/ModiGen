block Feedback
  extends ModelicaByExample.Components.BlockDiagrams.Interfaces.RealOutput;
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput u1;
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput u2;
equation
  y = u1.y - u2.y;
end Feedback;