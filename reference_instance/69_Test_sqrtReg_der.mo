model Test_sqrtReg_der
  Real y;
equation
  y = AES.Functions.sqrtReg_der(x=3.1415926,delta=0.01,dx=0.1);
end Test_sqrtReg_der;
