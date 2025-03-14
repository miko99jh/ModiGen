function layer_fcf_distances "face-centres-face" 
  extends Modelica.Icons.Function;
  input Real s[:] "layer thicknesses";
  output Real d[size(s,1) + 1];
protected
  Integer n;
algorithm
  n := size(s,1);
  d[1] := s[1] / 2;
  d[n + 1] := s[n] / 2;
  for i in 2:n loop
    d[i] := s[i - 1] / 2 + s[i] / 2;
  end for;
end layer_fcf_distances;
