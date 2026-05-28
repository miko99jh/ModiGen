model Gain
 extends Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.PartialOpAmp;

  parameter Real k(min=0) = 1 "Desired amplification factor";
  parameter Modelica.Units.SI.Resistance R1 = 1000 "Resistance connected to the negative input";
  parameter Modelica.Units.SI.Resistance R2 = k * R1 "Feedback resistance to achieve desired gain";

  Modelica.Electrical.Analog.Basic.Resistor r1(R=R1) "Input resistor";
  Modelica.Electrical.Analog.Basic.Resistor r2(R=R2) "Feedback resistor";

equation
  // Inverting Path
  connect(p1, r1.p);
  connect(r1.n, in_n);

  // Feedback Loop
  connect(out, r2.p);
  connect(r2.n, in_n);

  // Common Reference
  connect(in_p, n1);
  connect(n1, n2);

  // Output Stage
  connect(out, p2);

end Gain;