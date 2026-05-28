function layer_fcf_distances
  input Real s[:];
  output Real d[:];
  protected Integer n = size(s, 1);
algorithm
  d = zeros(n + 1, 1);
  d[1] = s[1] / 2;
  for i in 2:n + 1 loop
    d[i] = (s[i - 1] + s[i - 2]) / 2;
  end for;
  d[n + 1] = s[n] / 2;
end layer_fcf_distances;