model Test_InterpolateVector
  parameter Real ybar[5,2]=[0.0, 0.0; 2.0, 0.0; 4.0, 2.0; 6.0, 0.0; 8.0, 0.0];
  Real y;
equation
  y = ModelicaByExample.Functions.Interpolation.InterpolateVector(time, ybar);
end Test_InterpolateVector;
