model SpherePropertiesExample
  Real radius = 5;
  Real surface;
  Real volume;
initial equation
  surface = SphereProperties(radius)(surface);
  volume = SphereProperties(radius)(volume);
equation
  //...
end SpherePropertiesExample;