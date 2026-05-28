model Example
 Real radius = 5;
  Real surface;
  Real volume;
initial equation
  surface = SphereProperties(radius).surface;
  volume = SphereProperties(radius).volume;
equation
  // More equations here...
end Example;