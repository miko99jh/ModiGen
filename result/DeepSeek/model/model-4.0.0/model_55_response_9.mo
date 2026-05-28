model Gain
  extends Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.PartialOpAmp;
  parameter Modelica.Units.SI.Resistance R1=1000 "Resistance at inverting input";
  parameter Real k=1 "Gain";
  Modelica.Electrical.Analog.Basic.Resistor r1(final R=R1) "Inverting resistor";
  Modelica.Electrical.Analog.Basic.Resistor r2(final R=k*R1) "Feedback resistor";
equation 
  connect(r1.p, in_n) "Inverting path";
  connect(r1.n, in_p) "Common reference";
  connect(r2.p, out) "Feedback loop";
  connect(r2.n, in_n) "Feedback loop";
  connect(out, p2) "Output stage";
end Gain;