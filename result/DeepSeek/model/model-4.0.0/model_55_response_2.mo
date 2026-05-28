model Gain
  extends Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.PartialOpAmp;
  parameter Modelica.Units.SI.Resistance R1=1000 "Resistance R1";
  parameter Real k=1 "Desired amplification factor";
  Modelica.Electrical.Analog.Basic.Resistor r1(final R=R1) "Input resistor";
  Modelica.Electrical.Analog.Basic.Resistor r2(final R=k*R1) "Feedback resistor";
equation 
  connect(r1.p, in_n) "Inverting path";
  connect(r2.p, out) "Feedback loop";
  connect(in_p, n1) "Common reference";
  connect(out, p2) "Output stage";
end Gain;