model Test_Rod_ArrayComprehensions
  ModelicaByExample.ArrayEquations.HeatTransfer.Rod_ArrayComprehensions rod_ArrayComprehensions(
    n=10, L=5.0, R=0.1, rho=2.0, h=7, k=10, C=15.0, Tamb=325);
  Real temperature;
equation
  temperature=rod_ArrayComprehensions.T[end];
end Test_Rod_ArrayComprehensions;
