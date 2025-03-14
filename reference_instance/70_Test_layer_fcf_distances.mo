model Test_layer_fcf_distances
  Real a[4] = {1,2,3,1};
  Real d[5];
equation
  d = AES.Functions.layer_fcf_distances(a);
end Test_layer_fcf_distances;
