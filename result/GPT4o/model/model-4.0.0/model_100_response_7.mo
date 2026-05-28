function CircleProperties
 input Real radius "Radius of the circle";
  output Real circumference "Circumference of the circle";
  output Real area "Area of the circle";
protected
  Real diameter "Diameter of the circle";
  constant Real pi = 3.14159 "Value of pi";
algorithm
  diameter := 2 * radius;
  circumference := pi * diameter;
  area := pi * radius * radius;
end CircleProperties;