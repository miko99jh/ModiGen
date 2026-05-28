model SphereModel
  parameter Real radius = 1;
  Real surface;
  Real volume;
equation
  SphereProperties(radius, surface, volume);
end SphereModel;