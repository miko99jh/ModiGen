model Reactions_Array
  parameter Real C[3] = {1, 1, 0} "Concentrations of chemicals";
  parameter Real k[3] = {0.1, 0.1, 10} "Reaction rate constants";
  Real derC[3](start={0, 0, 0}) "Rate of change of concentrations";
equation
  der(C[1]) = derC[1];
  der(C[2]) = derC[2];
  der(C[3]) = derC[3];
  derC[1] = -k[1]*C[1]*C[2] + k[2]*C[3];
  derC[2] = -k[1]*C[1]*C[2] + k[2]*C[3] - k[3]*C[2]*C[3];
  derC[3] = k[1]*C[1]*C[2] - k[2]*C[3] - k[3]*C[2]*C[3];
end Reactions_Array;