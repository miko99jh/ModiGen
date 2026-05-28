block Feedback
  extends ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput(n=2);
  extends ModelicaByExample.Components.BlockDiagrams.Interfaces.RealOutput(n=1);
equation
  y = u1 - u2;
end Feedback;