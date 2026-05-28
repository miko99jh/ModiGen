function PotentialEnergy
  input Real m "Mass";
  input Real h "Height";
  input Real g = 9.81 "Gravitational acceleration";
  output Real pe "Gravitational potential energy";
algorithm 
  pe := m*g*h;
end PotentialEnergy;