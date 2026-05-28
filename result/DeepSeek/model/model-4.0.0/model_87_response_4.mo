model SimplePendulum
 parameter Real L(unit="m") = 1;
  parameter Real m(unit="kg") = 1;
  parameter Real g(unit="m/s^2") = 9.81;
  Real theta(start=1.5, unit="rad") = 1.5;
  Real omega(start=0, unit="rad/s") = 0;
  Real tau(unit="N.m") = 0;
equation 
  tau = m*g*L*sin(theta);
  der(omega) = (tau - m*g*L*sin(theta))/L/m;
  der(theta) = omega;
end SimplePendulum;