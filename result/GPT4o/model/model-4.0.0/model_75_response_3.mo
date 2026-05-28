block FromPolar
 extends Modelica.Blocks.Interfaces.MIMOs(final n=2);

protected 
  // Local variables can be declared here if needed

equation 
  // Coordinate transformation from polar to Cartesian
  y[1] = u[1] * Modelica.Math.cos(u[2]); // x-component
  y[2] = u[1] * Modelica.Math.sin(u[2]); // y-component

end FromPolar;