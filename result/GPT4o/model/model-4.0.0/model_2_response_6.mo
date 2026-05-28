function layer_fcf_distances
 input Real s[:]; // Array of layer thicknesses
  output Real d[size(s, 1) + 1]; // Array of distances between face centers
protected
  Integer n = size(s, 1); // Size of the input array
algorithm
  // Assign the first element of d
  d[1] := s[1] / 2;
  
  // Calculate distances between face centers for each layer
  for i in 2:n loop
    d[i] := (s[i-1] + s[i]) / 2;
  end for;
  
  // Assign the last element of d
  d[n+1] := s[n] / 2;
end layer_fcf_distances;