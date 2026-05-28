function layer_fcf_distances
 input Real s[:]; // Array representing the thicknesses of the layers
  output Real d[size(s, 1) + 1]; // Array representing the distances between face centers
protected
  Integer n; // Size of the input array s
algorithm
  n := size(s, 1);
  // Assign the first element of d as half of the first element of s
  d[1] := s[1] / 2;
  // Calculate the distances between face centers for each layer
  for i in 2:n loop
    d[i] := (s[i-1] + s[i]) / 2;
  end for;
  // Assign the last element of d as half of the last element of s
  d[n+1] := s[n] / 2;
end layer_fcf_distances;