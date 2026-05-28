function SphereProperties
 input Real radius "Radius of the sphere";
  output Real surface "Surface area of the sphere";
  output Real volume "Volume of the sphere";
algorithm
  surface := 4 * Modelica.Constants.pi * radius^2;
  volume := (4/3) * Modelica.Constants.pi * radius^3;
end SphereProperties;