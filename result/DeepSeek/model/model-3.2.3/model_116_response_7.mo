model Reactions_Array
  parameter Real C[3] = {1, 1, 0} "Concentrations of chemicals";
  parameter Real k[3] = {0.1, 0.1, 10} "Reaction rate constants";
  Real d_C[3] "Rate of change of concentrations";
equation
  der(C) = d_C;
  d_C = {-k[1]*C[1]*C[2] + k[2]*C[3], -k[1]*C[1]*C[2] + k[2]*C[3] - k[3]*C[2]*C[3], k[1]*C[1]*C[2] - k[2]*C[3] - k[3]*C[2]*C[3]};
end Reactions_Array;