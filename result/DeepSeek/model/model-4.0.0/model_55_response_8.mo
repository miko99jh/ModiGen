model Gain
  extends Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.PartialOpAmp;
  parameter Modelica.SIunits.Resistance R1=1000 "Resistance R1";
  parameter Real k=1 "Gain";
  Modelica.Electrical.Analog.Basic.Resistor r1(final R=R1) "Resistor R1";
  Modelica.Electrical.Analog.Basic.Resistor r2(final R=k*R1) "Resistor R2";
equation 
  connect(r1.p, in_n) "Inverting input";
  connect(r2.p, out) "Feedback loop";
  connect(in_p, n1) "Common reference";
  connect(n2, out) "Output stage";
  connect(r2.n, in_n) "Feedback loop";
end Gain;