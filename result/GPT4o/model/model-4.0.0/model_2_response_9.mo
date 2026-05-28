function layer_fcf_distances
 input Real s[:]; // Array representing the thicknesses of the layers
  output Real d[size(s, 1) + 1]; // Array representing the distances between face centers
protected
  Integer n; // Size of the input array s
algorithm
  n := size(s, 1);
  d[1] := s[1] / 2; // First element of d is half of the first element of s
  d[n + 1] := s[n] / 2; // Last element of d is half of the last element of s
  for i in 2:n loop
    d[i] := (s[i - 1] + s[i]) / 2; // Average of the current and previous layer thicknesses
  end for;
end layer_fcf_distances;