block Feedback
  extends ModelicaByExample.Components.BlockDiagrams.Interfaces.RealInput;
  extends ModelicaByExample.Components.BlockDiagrams.Interfaces.RealOutput;

  parameter Modelica.SIunits.Time t=0.001;

equation
  y = u1 - u2;
end Feedback;