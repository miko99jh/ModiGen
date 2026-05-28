function CircleProperties
  input Real radius;
  output Real circumference;
  output Real area;
protected 
  Real diameter;
algorithm 
  diameter := 2 * radius;
  circumference := 3.14159 * diameter;
  area := 3.14159 * radius * radius;
end CircleProperties;