model Test_ABCD
  extends ModelicaByExample.ArrayEquations.StateSpace.ABCD(nx=2, nu=0, ny=0, x0={10, 10});
  Real alpha=0.1;
  Real beta=0.02;
  Real gamma=0.4;
  Real delta=0.02;
equation
  A=[alpha-beta*x[2], 0; 0, -gamma+delta*x[1]];
  B = fill(0,2,0);
  C = fill(0,0,2);
  D = fill(0,0,0);
  u = fill(0,0);
end Test_ABCD;
