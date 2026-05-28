block FromPolar extends Modelica.Blocks.Interfaces.MIMOs
  parameter Integer n=2 "Number of output connectors";
  input Real u[n] "Input vector [magnitude, angle]";
  output Real y[n] "Output vector [real, imag]";
equation
  y[1] = u[1]*cos(u[2]);
  y[2] = u[1]*sin(u[2]);
end FromPolar;