model Gain "Inverting operational amplifier circuit"
  extends Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.PartialOpAmp;
  parameter Real k(final min=0)=1 "Desired amplification";
  parameter Modelica.Units.SI.Resistance R1=1000 "Resistance at negative input of OpAmp";
  parameter Modelica.Units.SI.Resistance R2=k*R1 "Calculated resistance to reach desired amplification k";
  Modelica.Electrical.Analog.Basic.Resistor r1(final R=R1);
  Modelica.Electrical.Analog.Basic.Resistor r2(final R=R2);
equation
  connect(opAmp.out, r2.p);
  connect(opAmp.out, p2);
  connect(r1.n, opAmp.in_n);
  connect(r1.n, r2.n);
  connect(r1.p, p1);
  connect(n1, opAmp.in_p);
  connect(n1, n2);
end Gain;
