model SphereModel
  parameter Real radius = 5;
  Real surface;
  Real volume;
initial equation
  surface = SphereProperties(radius);
  volume = SphereProperties(radius);
equation
  // additional equations can be added here
end SphereModel;