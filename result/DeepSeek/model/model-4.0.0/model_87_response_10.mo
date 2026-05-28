model SimplePendulum
  parameter Real L(unit="m") = 1;
  parameter Real m(unit="kg") = 1;
  parameter Real g(unit="m/s^2") = 9.81;
  Real theta(start=1.5) "Angle of pendulum";
  Real omega(start=0) "Angular velocity of pendulum";
  parameter Real dt(unit="s")=0.01;
equation
  // Add your equations here
end SimplePendulum;