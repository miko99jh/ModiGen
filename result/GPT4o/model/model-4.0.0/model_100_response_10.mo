function CircleProperties
 input Real radius "Radius of the circle";
  output Real circumference "Circumference of the circle";
  output Real area "Area of the circle";
protected
  Real diameter "Diameter of the circle";
algorithm
  diameter := 2 * radius;
  circumference := diameter * 3.14159;
  area := 3.14159 * radius * radius;
end CircleProperties;