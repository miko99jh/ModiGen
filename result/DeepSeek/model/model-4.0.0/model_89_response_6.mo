model NewtonCoolingDynamic
  parameter Real T0(unit="degC") = 100;
  parameter Real T_inf(unit="degC") = 25;
  parameter Real A(unit="m^2") = 1;
  parameter Real m(unit="kg") = 1;
  parameter Real c_p(unit="J/(kg.degC)") = 4200;
  parameter Real h(unit="W/(m^2.degC)") = 767;
  Real T(start=T0, unit="degC");
equation
  der(T) = -h*A*(T-T_inf)/m/c_p;
  when time = 20 "s" then
    T_inf = 0 "degC";
  end when;
end NewtonCoolingDynamic;