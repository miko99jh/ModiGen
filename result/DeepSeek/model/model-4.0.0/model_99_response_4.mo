model ExampleUsage
 parameter Real mass = 70 "Mass of the object in kilograms";
  parameter Real height = 2 "Height of the object in meters";
  Real energy;
equation 
  energy = PotentialEnergy(mass, height);
end ExampleUsage;