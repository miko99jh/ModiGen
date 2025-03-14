model Test_layer_fcf_conductivities
  Real s[4]={1,2,3,1};
  Real lambda[4]={1.5,2,1.5,2};
  Real d[5];
equation
  d = AES.Functions.layer_fcf_conductivities(s, lambda);
end Test_layer_fcf_conductivities;
