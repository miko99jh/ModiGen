function Rotator "Rotates space phasor"
  extends Modelica.Icons.Function;
  input Real x[2] "Input space phasor";
  input Modelica.Units.SI.Angle angle "Input angle of rotation";
  output Real y[2] "Output space phasor";
protected
  Real RotationMatrix[2, 2]={{+cos(-angle),-sin(-angle)},{+sin(-angle),+
 cos(-angle)}};
algorithm
  y := RotationMatrix*x;
end Rotator;
