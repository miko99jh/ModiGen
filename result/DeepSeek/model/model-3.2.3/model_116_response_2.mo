model Reactions_Array
  parameter Real C[3] = {1, 1, 0};
  parameter Real k[3] = {0.1, 0.1, 10};
  Real derC[3](start={0, 0, 0});
equation
  der(C) = derC;
  derC = {-k[1]*C[1]*C[2] + k[2]*C[3], -k[1]*C[1]*C[2] + k[2]*C[3] - k[3]*C[2]*C[3], k[1]*C[1]*C[2] - k[2]*C[3] - k[3]*C[2]*C[3]};
end Reactions_Array;