model Sphere
  parameter Real radius = 5 "Radius of the sphere";
  Real surface;
  Real volume;
equation
  SphereProperties(radius, surface, volume);
end Sphere;