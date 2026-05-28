model NewtonCoolingDynamic
 // Parameters
  parameter Real T0 = 100; // Initial temperature of water in °C
  parameter Real T_inf_initial = 25; // Initial ambient temperature in °C
  parameter Real A = 1; // Area in m²
  parameter Real m = 1; // Mass in kg
  parameter Real c_p = 4200; // Specific heat capacity in J/(kg.°C)
  parameter Real h = 767; // Convection cooling coefficient in W/(m².°C)

  // Variables
  Real T(start = T0); // Temperature of the water in °C
  Real T_inf; // Ambient temperature in °C

initial equation
  T = T0; // Set initial temperature

equation
  // Define the ambient temperature change after 20 seconds
  if time < 20 then
    T_inf = T_inf_initial;
  else
    T_inf = 0;
  end if;

  // Newton's law of cooling
  der(T) = - (h * A / (m * c_p)) * (T - T_inf);

end NewtonCoolingDynamic;