model NewtonCoolingDynamic
  parameter Real T0(unit="degC") = 100;
  parameter Real T_inf(unit="degC") = 25;
  parameter Real A(unit="m^2") = 1;
  parameter Real m(unit="kg") = 1;
  parameter Real c_p(unit="J/(kg.degC)") = 4200;
  parameter Real h(unit="W/(m^2.degC)") = 767;
  Real T(start=T0, unit="degC");
  Real Q_dot(unit="W");
  Real Q_dot_conv(unit="W");
  Real Q_dot_rad(unit="W");
initial equation
  T = T0;
equation
  der(T) = (Q_dot - Q_dot_conv)/ (m*c_p);
  Q_dot_conv = h*A*(T_inf - T);
  Q_dot = Q_dot_conv;
  when time = 20 "s" then
    T_inf = 0 "degC";
end NewtonCoolingDynamic;