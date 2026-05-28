function Rotator
  extends Modelica.Icons.Function;
  input Real x[2] "Input for the space phasor";
  input Modelica.Units.SI.Angle angle "Input for the angle of rotation";
  output Real y[2] "Output for the rotated space phasor";
  protected 
  Real RotationMatrix[2,2] = {{+cos(-angle), -sin(-angle)}, {+sin(-angle), +cos(-angle)}} "Rotation matrix";
  algorithm 
    y := RotationMatrix*x;
  end Rotator;