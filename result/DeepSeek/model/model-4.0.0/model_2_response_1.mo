function layer_fcf_distances
  input Real s[:];
  output Real d[:];
  protected Integer n = size(s, 1);
algorithm 
  d[1] := 0.5*s[1];
  for i in 2:n loop
    d[i] := 0.5*(s[i-1] + s[i]);
  end for;
  d[n+1] := 0.5*s[n];
end layer_fcf_distances;