model RLC
  ModelicaByExample.ArrayEquations.StateSpace.LTI rlc_comp(
    nx=2,
    nu=1,
    ny=2,
    x0={0, 0},
    A=[-1/(100*0.001), 1/0.001; -1/1, 0],
    B=[0; 1/1],
    C=[1/100, 0; -1/100, 1],
    D=[0; 0],
    u=Vb);
  parameter Modelica.SIunits.Voltage Vb=24 "Voltage source";
equation 
  // Connect the input 'u' of LTI component to the voltage source
  rlc_comp.u = Vb;
end RLC;