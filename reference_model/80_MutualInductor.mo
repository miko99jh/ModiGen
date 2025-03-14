model MutualInductor "Linear mutual inductor"
  extends Modelica.Electrical.Polyphase.Interfaces.OnePort;
  parameter Real epsilon=1e-9 "Relative accuracy tolerance of matrix symmetry";
  parameter Modelica.Units.SI.Inductance L[m, m] "Mutual inductance matrix";
initial equation
  if abs(Modelica.Math.Matrices.det(L)) < epsilon then
    Modelica.Utilities.Streams.print("Warning: mutual inductance matrix singular!");
  end if;
equation
  assert(sum(abs(L - transpose(L))) < epsilon*sum(abs(L)),"Mutual inductance matrix is not symmetric");
  for j in 1:m loop
    v[j] = sum(L[j, k]*der(i[k]) for k in 1:m);
  end for;
end MutualInductor;
