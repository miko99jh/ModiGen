block Feedback
  extends ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput;
  extends ModelicaByExample.Components.BlockDiagrams.Interfaces.RealOutput;
  parameter Modelica.SIunits.Time tDelay = 0 "Delay time";
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput u1;
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput u2;
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealOutput y;
equation 
  y = u1.y - u2.y;
end Feedback;