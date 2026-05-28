model NewtonCoolingDynamic
  parameter Real T0(unit = "degC") = 100; // Initial temperature of water
  parameter Real T_inf(unit = "degC") = 25; // Ambient temperature
  parameter Real A(unit = "m^2") = 1; // Water meter area
  parameter Real m(unit = "kg") = 1; // Mass
  parameter Real c_p(unit = "J/(kg.degC)") = 4200; // Specific heat
  parameter Real h(unit = "W/(m^2.degC)") = 767; // Convection cooling coefficient
  Real T(start = T0, unit = "degC"); // Temperature of water
equation
  der(T) = (T_inf - T) / (A * h); // Newton's law of cooling
  when time = 20 "s" then
    T_inf = 0 "degC"; // Ambient temperature suddenly dropped to 0°C
  end when;
end NewtonCoolingDynamic;