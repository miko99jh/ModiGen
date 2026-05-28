model Gain
  extends Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.PartialOpAmp;
  parameter Modelica.Units.SI.Resistance R1 = 1000 "Resistance R1";
  parameter Real k = 1 "Gain";
  Modelica.Electrical.Analog.Basic.Resistor r1(R=R1) "Input resistor";
  Modelica.Electrical.Analog.Basic.Resistor r2(R=k*R1) "Feedback resistor";
equation 
  connect(r1.p, in_n) "Inverting input";
  connect(r1.n, in_p) "Non-inverting input";
  connect(r2.p, out) "Feedback resistor";
  connect(r2.n, in_n) "Inverting input";
  connect(out, p2) "Output";
end Gain;