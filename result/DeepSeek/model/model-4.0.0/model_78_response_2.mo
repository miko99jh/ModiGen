block ToDQ extends Modelica.Blocks.Interfaces.MIMO(final nin=m, final nout=2)
  parameter Integer m(min=1) = 3;
  parameter Integer p;
  Modelica.Blocks.Math.Gain toGamma(final k=p);
  Modelica.Electrical.Machines.SpacePhasors.Blocks.Rotator rotator;
  Modelica.Blocks.Interfaces.RealInput phi(unit="rad");
  Modelica.Electrical.Machines.SpacePhasors.Blocks.ToSpacePhasor toSpacePhasor(final m=m);
equation 
  connect(phi, toGamma.u);
  connect(toGamma.y, rotator.w);
  connect(toSpacePhasor.u, u);
  connect(toSpacePhasor.y, rotator.u);
  connect(rotator.y, y);
end ToDQ;