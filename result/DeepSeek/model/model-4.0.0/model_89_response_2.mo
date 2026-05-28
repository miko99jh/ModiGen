model NewtonCoolingDynamic
  parameter Real T0 = 100 "Initial temperature of water";
  parameter Real T_inf_initial = 25 "Initial ambient temperature";
  parameter Real A = 1 "Water meter area";
  parameter Real m = 1 "Mass";
  parameter Real c_p = 4200 "Specific heat";
  parameter Real h = 767 "Convection cooling coefficient";
  Real T(start=T0) "Temperature of water";
  Real T_inf(start=T_inf_initial) "Ambient temperature";
  Real Q_dot "Heat transfer rate";
equation
  der(T) = (Q_dot - m*c_p*der(T))/m/c_p;
  Q_dot = h*A*(T_inf - T);
  when time == 20 "20 seconds after the start of the simulation, the ambient temperature suddenly dropped to 0°C" then
    der(T_inf) = -1;
    T_inf = 0;
  end when;
end NewtonCoolingDynamic;