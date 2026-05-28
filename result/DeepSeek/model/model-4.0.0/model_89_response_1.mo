model NewtonCoolingDynamic
  parameter Real T0 = 100 "Initial temperature of water";
  parameter Real T_inf(start=25) = 0 "Ambient temperature";
  parameter Real A = 1 "Water meter area";
  parameter Real m = 1 "Mass";
  parameter Real c_p = 4200 "Specific heat";
  parameter Real h = 767 "Convection cooling coefficient";
  Real T(start=T0) "Temperature of water";
equation
  der(T) = -h*A*(T-T_inf)/m/c_p;
  when time = 20 "20 seconds after the start of the simulation, the ambient temperature suddenly dropped to 0°C" then
    T_inf = 0;
  end when;
end NewtonCoolingDynamic;