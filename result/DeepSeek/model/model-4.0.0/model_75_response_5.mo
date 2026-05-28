block FromPolar extends Modelica.Blocks.Interfaces.MIMOs
  parameter Integer n=2 "Number of inputs";
  input Real u[n] "Input vector";
  output Real y[n] "Output vector";
equation
  y[1] = u[1]*cos(u[2]);
  y[2] = u[1]*sin(u[2]);
end FromPolar;