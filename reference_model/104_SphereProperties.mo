function SphereProperties
  input Real radius;
  output Real surface;
  output Real volume;
algorithm
  surface := 4*Modelica.Constants.pi*radius^2;
  volume := 4/3*Modelica.Constants.pi*radius^3;
end SphereProperties;
