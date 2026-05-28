block Feedback
  extends ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput(n=2);
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealOutput y;
equation 
  y = u1 - u2;
end Feedback;