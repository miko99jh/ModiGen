function PotentialEnergy
  input Real m "mass";
  input Real h "height";
  input Real g=9.81 "gravity";
  output Real pe "potential energy";
algorithm
  pe := m*g*h;
end PotentialEnergy;
