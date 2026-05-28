function Rotator
  extends Modelica.Icons.Function;
  input Real x[2];
  input Modelica.Units.SI.Angle angle;
  output Real y[2];
protected 
  Real RotationMatrix[2, 2] = {{+cos(-angle), -sin(-angle)}, {+sin(-angle), +cos(-angle)}};
algorithm 
  y := RotationMatrix*x;
end Rotator;