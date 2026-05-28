function layer_fcf_distances
  input Real s[:];
  output Real d[:] = size(s, 1) + 1;
  protected Integer n = size(s, 1);
algorithm 
  d[1] := 0.5*s[1];
  d[n+1] := 0.5*s[n];
  for i in 2:n loop
    d[i] := 0.5*(s[i] + s[i-1]);
  end for;
end layer_fcf_distances;