model MutualInductor
  extends Modelica.Electrical.Polyphase.Interfaces.OnePort;
  parameter Real epsilon=1e-9 "Relative accuracy tolerance of matrix symmetry";
  parameter Modelica.Units.SI.Inductance L[m, m] "Mutual inductance matrix";

  initial equation
    if abs(Modelica.Math.Matrices.det(L)) < epsilon then
      Modelica.Utilities.Streams.print("Warning: mutual inductance matrix singular!");
    end if;

  equation
    // Symmetry verification
    assert(abs(sum(abs(L - transpose(L)))) < epsilon, "Mutual inductance matrix is not symmetric");

    // Voltage-current relationship
    v = L * der(i);
end MutualInductor;