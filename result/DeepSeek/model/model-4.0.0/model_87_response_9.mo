model SimplePendulum
  parameter Real L=1 "Length of pendulum";
  parameter Real m=1 "Mass of pendulum";
  parameter Real g=9.81 "Gravity constant";
  Real theta(start=1.5) "Angle of pendulum";
  Real omega(start=0) "Angular velocity of pendulum";
initial equation
  //equations go here
end SimplePendulum;