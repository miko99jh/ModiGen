block FromPolar extends Modelica.Blocks.Interfaces.MIMOs(final n=2);
  input Real u[2] "Polar components (magnitude, angle)";
  output Real y[2] "Cartesian components";
equation
  y[1] = u[1]*cos(u[2]);
  y[2] = u[1]*sin(u[2]);
end FromPolar;