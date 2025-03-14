block Feedback "A block to compute feedback terms"
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput u1;
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput u2;
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealOutput y;
equation
  y = u1-u2;
end Feedback;
