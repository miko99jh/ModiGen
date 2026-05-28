function PotentialEnergy
 input Real m "Mass of the object in kilograms";
  input Real h "Height of the object in meters";
  input Real g = 9.81 "Gravitational acceleration in m/s², default is 9.81";
  output Real pe "Gravitational potential energy in joules";
algorithm
  pe := m * g * h;
end PotentialEnergy;