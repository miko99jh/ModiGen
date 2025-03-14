model Test_conjugate
   Complex u=Complex(4,3);
   Complex y;
equation
  y=AES.Functions.conjugate(u);
end Test_conjugate;
