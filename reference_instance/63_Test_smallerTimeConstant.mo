model Test_smallerTimeConstant
  Real T;
algorithm
  T := PowerGrids.Functions.smallerTimeConstant(a=8, b=15);
end Test_smallerTimeConstant;
