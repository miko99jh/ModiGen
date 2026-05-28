model Reactions_Array
  parameter Real C[3](start={1, 1, 0}) "Concentration of chemicals";
  parameter Real k[3](default={0.1, 0.1, 10}) "Reaction rate constants";
  Real derC[3] "Rate of change of concentration";
equation
  derC = {-k[1]*C[1]*C[2] + k[2]*C[3], -k[1]*C[1]*C[2] + k[2]*C[3] - k[3]*C[2]*C[3], k[1]*C[1]*C[2] - k[2]*C[3] - k[3]*C[2]*C[3]};
end Reactions_Array;