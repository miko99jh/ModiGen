model NewtonCoolingDynamic
  parameter Real T0 = 100 "Initial temperature of water";
  parameter Real T_inf1 = 25 "Ambient temperature";
  parameter Real A = 1 "Water meter area";
  parameter Real m = 1 "Mass";
  parameter Real c_p = 4200 "Specific heat";
  parameter Real h = 767 "Convection cooling coefficient";
  Real T(start=T0) "Temperature of water";
  Real T_inf(start=T_inf1) "Ambient temperature";
  Real Q_dot "Heat transfer rate";
equation
  der(T) = (T_inf - T) / (m * c_p) * A * h;
  Q_dot = A * h * (T_inf - T);
  when time = 20 "s" then
    T_inf = 0 "K";
  end when;
end NewtonCoolingDynamic;