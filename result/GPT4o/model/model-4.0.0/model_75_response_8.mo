block FromPolar
 extends Modelica.Blocks.Interfaces.MIMOs(final n=2);

  // Input and output connectors
  input Real u[2]; // Polar coordinates: u[1] = magnitude, u[2] = angle
  output Real y[2]; // Cartesian coordinates: y[1] = x, y[2] = y

equation
  // Coordinate transformation from polar to Cartesian
  y[1] = u[1] * cos(u[2]); // x-component
  y[2] = u[1] * sin(u[2]); // y-component

end FromPolar;