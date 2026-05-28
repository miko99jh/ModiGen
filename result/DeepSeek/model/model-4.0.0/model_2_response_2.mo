function layer_fcf_distances
  input Real s[:];
  output Real d[:] = size(s, 1) + 1;
  protected Integer n = size(s, 1);
algorithm 
  for i in 1:n loop
    d[i] := 0.5 * s[i];
  end for;
  for i in 2:n loop
    d[i] := (d[i-1] + 0.5 * s[i]) / 2;
  end for;
  d[n+1] := 0.5 * s[n];
end layer_fcf_distances;