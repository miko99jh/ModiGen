model Example
  Real m = 10.0 "Mass";
  Real h = 100.0 "Height";
  Real pe = PotentialEnergy(m, h) "Gravitational potential energy";
equation 
  assert(pe == 9810.0, "Potential energy calculation is incorrect");
end Example;