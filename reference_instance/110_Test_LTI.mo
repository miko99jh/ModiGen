model Test_LTI
  extends ModelicaByExample.ArrayEquations.StateSpace.LTI(
    nx = 1, 
    nu = 1, 
    A = [-1], 
    B = [1], 
    u = {1});
end Test_LTI;
