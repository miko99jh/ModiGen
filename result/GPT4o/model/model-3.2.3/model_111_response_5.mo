model NewtonCooling
 // Parameters
  parameter Real T_inf = 300.0 "Ambient temperature (K)";
  parameter Real T0 = 280.0 "Initial temperature (K)";
  parameter Real h = 0.7 "Convective cooling coefficient (W/m^2.K)";
  parameter Real A = 1.0 "Surface area (m^2)";
  parameter Real m = 0.1 "Mass of thermal capacitance (kg)";
  parameter Real c_p = 1.2 "Specific heat capacity (J/kg.K)";

  // Variables
  Real T(start = T0) "Temperature of the object (K)";

equation
  // Newton's law of cooling
  m * c_p * der(T) = h * A * (T_inf - T);

end NewtonCooling;