function Rotator
 extends Modelica.Icons.Function;
  input Real x[2] "Input space phasor";
  input Modelica.Units.SI.Angle angle "Angle of rotation";
  output Real y[2] "Output rotated space phasor";
protected 
  Real RotationMatrix[2, 2] = {{cos(-angle), -sin(-angle)}, 
                               {sin(-angle),  cos(-angle)}};
algorithm 
  y[1] := RotationMatrix[1, 1] * x[1] + RotationMatrix[1, 2] * x[2];
  y[2] := RotationMatrix[2, 1] * x[1] + RotationMatrix[2, 2] * x[2];
end Rotator;