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
  // Newton's law of cooling
  Q_dot = h * A * (T_inf - T);
  // Energy balance
  der(T) = (Q_dot - Q_dot_conv - Q_dot_rad) / (m * c_p);
  // After 20 seconds, the ambient temperature suddenly dropped to 0°C
  when time > 20 then
    T_inf = 0;
  end when;
end NewtonCoolingDynamic;