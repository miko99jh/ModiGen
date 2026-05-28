model Gain
 extends Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.PartialOpAmp;

  // Parameters
  parameter Real k(min=0) = 1 "Amplification factor";
  parameter Modelica.Units.SI.Resistance R1 = 1000 "Input resistance (ohms)";
  parameter Modelica.Units.SI.Resistance R2 = k * R1 "Feedback resistance (ohms)";

  // Components
  Modelica.Electrical.Analog.Basic.Resistor r1(final R=R1) "Input resistor";
  Modelica.Electrical.Analog.Basic.Resistor r2(final R=R2) "Feedback resistor";

equation
  // Inverting path: input signal through r1 to inverting input
  connect(p1, r1.p);
  connect(r1.n, in_n);

  // Feedback loop: output signal through r2 to inverting input
  connect(out, r2.p);
  connect(r2.n, in_n);

  // Non-inverting input tied to reference
  connect(in_p, n1);

  // Output stage: amplifier output connected to external terminal
  connect(out, p2);

  // Common reference: shared reference path
  connect(n1, n2);
end Gain;