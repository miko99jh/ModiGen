block FromPolar1 "Converts a space phasor from polar coordinates"
  extends Modelica.Blocks.Interfaces.MIMOs(final n=2);
equation
  y = u[1]*{cos(u[2]),sin(u[2])};
end FromPolar1;
