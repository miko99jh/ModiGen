model Test_Quadratic
  Real y;
equation
  y = ModelicaByExample.Functions.Nonlinearities.Quadratic(a=2.0,b=3.0,c=1.0,x=time);
end Test_Quadratic;
