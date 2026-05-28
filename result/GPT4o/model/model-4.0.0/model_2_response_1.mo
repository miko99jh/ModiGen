function layer_fcf_distances
 input Real s[:]; // Array of layer thicknesses
  output Real d[size(s, 1) + 1]; // Array of distances between face centers
protected
  Integer n; // Size of the input array s
algorithm
  n := size(s, 1);
  // Assign the first and last elements of d
  d[1] := s[1] / 2;
  d[n + 1] := s[n] / 2;
  
  // Calculate the distances between face centers for each layer
  for i in 2:n loop
    d[i] := (s[i - 1] + s[i]) / 2;
  end for;
end layer_fcf_distances;