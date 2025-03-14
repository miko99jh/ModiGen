model Test_conv
  Real cp1[4]={1,2,3,1};
  Real cp2[2]={3,5};
  Real[5] cpo;
equation
  cpo = AES.Functions.conv(cp1, cp2);
end Test_conv;
