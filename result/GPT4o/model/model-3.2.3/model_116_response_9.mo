model Reactions_Array
 // Parameters
  parameter Real k[3] = {0.1, 0.1, 10}; // Reaction rate constants

  // Variables
  Real C[3](start = {1, 1, 0}); // Concentrations of chemicals

equation
  // Differential equations representing the rate of change of concentrations
  der(C[1]) = -k[1]*C[1]*C[2] + k[2]*C[3];
  der(C[2]) = -k[1]*C[1]*C[2] + k[2]*C[3] - k[3]*C[2]*C[3];
  der(C[3]) = k[1]*C[1]*C[2] - k[2]*C[3] - k[3]*C[2]*C[3];
end Reactions_Array;