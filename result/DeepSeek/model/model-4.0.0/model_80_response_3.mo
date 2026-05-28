model MutualInductor
  extends Modelica.Electrical.Polyphase.Interfaces.OnePort;
  parameter Real epsilon=1e-9 "Relative accuracy tolerance of matrix symmetry";
  parameter Modelica.Units.SI.Inductance L[m, m] "Mutual inductance matrix";

  initial equation
    if abs(Modelica.Math.Matrices.det(L)) < epsilon then
      Modelica.Utilities.Streams.print("Warning: mutual inductance matrix singular!");
    end if;

  equation
    // Symmetry Verification
    assert(abs(sum(abs(L - transpose(L)))) < epsilon, "Mutual inductance matrix is not symmetric");

    // Voltage-Current Relationship
    v = if m == 1 then
        {L[1, 1] * der(i[1])}
      else
        [for j in 1:m collect L[j, 1:m] * der(i[1:m])];
end MutualInductor;