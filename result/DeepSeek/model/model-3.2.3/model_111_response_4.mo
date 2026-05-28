model NewtonCooling
  parameter Real T_inf = 300.0 "Ambient temperature";
  parameter Real T0 = 280.0 "Initial temperature";
  parameter Real h = 0.7 "Convection coefficient";
  parameter Real A = 1.0 "Surface area";
  parameter Real m = 0.1 "Mass";
  parameter Real c_p = 1.2 "Specific heat capacity";
  Real T(start=T0) "Temperature";
equation
  der(T) = (h*A*(T_inf-T) - m*c_p*T)/(m*c_p);
end NewtonCooling;