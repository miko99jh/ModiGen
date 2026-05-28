model RLC
  ModelicaByExample.ArrayEquations.StateSpace.LTI rlc_comp(nx=2, nu=1, ny=2, x0={0, 0}, A=[-1/(100*0.001), 1/0.001; -1/1, 0], B=[0; 1/1], C=[1/100, 0; -1/100, 1], D=[0; 0]);
  parameter Real Vb=24 "Voltage source";
  Real u[1] = {Vb} "Voltage source";
equation 
  rlc_comp.u = u;
end RLC;