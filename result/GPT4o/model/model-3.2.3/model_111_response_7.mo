model NewtonCooling
 // Parameters
  parameter Temperature T_inf = 300.0 "Ambient temperature";
  parameter Temperature T0 = 280.0 "Initial temperature";
  parameter ConvectionCoefficient h = 0.7 "Convective cooling coefficient";
  parameter Area A = 1.0 "Surface area";
  parameter Mass m = 0.1 "Mass of thermal capacitance";
  parameter SpecificHeat c_p = 1.2 "Specific heat capacity";

  // Variables
  Temperature T(start = T0) "Temperature of the object";

equation
  // Newton's law of cooling
  m * c_p * der(T) = h * A * (T_inf - T);

end NewtonCooling;