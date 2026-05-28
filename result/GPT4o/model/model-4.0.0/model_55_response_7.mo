model Gain
 extends Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.PartialOpAmp;

  parameter Real k(min=0) = 1 "Desired amplification factor";
  parameter Modelica.Units.SI.Resistance R1 = 1000 "Resistance connected to the negative input";
  parameter Modelica.Units.SI.Resistance R2 = k * R1 "Feedback resistance to achieve desired gain";

  Modelica.Electrical.Analog.Basic.Resistor r1(R=R1) "Input resistor";
  Modelica.Electrical.Analog.Basic.Resistor r2(R=R2) "Feedback resistor";

equation
  // Inverting Path
  connect(p1, r1.p) "Connect input to r1";
  connect(r1.n, in_n) "Connect r1 to inverting input of OpAmp";

  // Feedback Loop
  connect(out, r2.p) "Connect OpAmp output to r2";
  connect(r2.n, in_n) "Connect r2 to inverting input of OpAmp";

  // Common Reference
  connect(in_p, n1) "Connect non-inverting input to reference";
  connect(n1, n2) "Ensure common reference for input and output";

  // Output Stage
  connect(out, p2) "Connect OpAmp output to external output terminal";

end Gain;