block Feedback
  extends ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput;
  extends ModelicaByExample.Components.BlockDiagrams.Interfaces.RealOutput;
  parameter Modelica.SIunits.Time t_delay = 0 "Delay time";
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput u1(final quantity="");
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput u2(final quantity="");
  ModelicaByExample.Components.BlockDiagrams.Interfaces.RealOutput y(final quantity="");
equation 
  y = u1 - u2;
end Feedback;