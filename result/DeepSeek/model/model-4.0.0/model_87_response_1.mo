model SimplePendulum
  parameter Real L(unit="m") = 1 "Length of pendulum";
  parameter Real m(unit="kg") = 1 "Mass of pendulum";
  parameter Real g(unit="m/s^2") = 9.81 "Gravity constant";
  Real theta(start=1.5, unit="rad") "Angle of pendulum";
  Real omega(start=0, unit="rad/s") "Angular velocity of pendulum";
  // Define the equations here
end SimplePendulum;