model Test_largerTimeConstant
  Real T;
algorithm
  T := PowerGrids.Functions.largerTimeConstant(a=8, b=15);
end Test_largerTimeConstant;
