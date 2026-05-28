function layer_fcf_distances
  input Real s[:];
  output Real d[:] = size(s, 1) + 1;
  protected Integer n = size(s, 1);
algorithm 
  d[1] := s[1]/2;
  d[n+1] := s[n]/2;
  for i in 2:n loop
    d[i] := (s[i-1] + s[i])/2;
  end for;
end layer_fcf_distances;