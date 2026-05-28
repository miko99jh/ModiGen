model Gain
  extends Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.PartialOpAmp;
  parameter Modelica.Units.SI.Resistance R1=1000 "Resistance R1";
  parameter Real k=1 "Gain";
  Modelica.Electrical.Analog.Basic.Resistor r1(R=R1);
  Modelica.Electrical.Analog.Basic.Resistor r2(R=k*R1);
equation 
  connect(r1.p, in_n) "Inverting input";
  connect(r1.n, r2.p) "Feedback loop";
  connect(r2.n, out) "Output";
  connect(in_p, n1) "Common reference";
  connect(n2, out) "Output";
  connect(out, p2) "External terminal";
end Gain;