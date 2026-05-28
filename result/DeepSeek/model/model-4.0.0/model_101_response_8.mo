model SphereModel
  parameter Real radius = 5 "Radius of the sphere";
  Real surface "Surface area of the sphere";
  Real volume "Volume of the sphere";
initial equation
  surface = SphereProperties(radius).surface;
  volume = SphereProperties(radius).volume;
equation
  // Additional equations or model components can be added here
end SphereModel;