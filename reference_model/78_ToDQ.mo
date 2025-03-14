block ToDQ
  "Transform instantaneous stator inputs to rotor fixed space phasor"
  extends Modelica.Blocks.Interfaces.MIMO(final nin=m, final nout=2);
  parameter Integer m(min=1) = 3 "Number of phases";
  parameter Integer p "Number of pole pairs";
  Modelica.Blocks.Math.Gain toGamma(final k=p);
  Modelica.Electrical.Machines.SpacePhasors.Blocks.Rotator rotator;
  Modelica.Blocks.Interfaces.RealInput phi(unit="rad");
  Modelica.Electrical.Machines.SpacePhasors.Blocks.ToSpacePhasor toSpacePhasor(final m=m);
equation
  connect(phi, toGamma.u);
  connect(rotator.angle, toGamma.y);
  connect(toSpacePhasor.y, rotator.u);
  connect(u, toSpacePhasor.u);
  connect(rotator.y, y);
end ToDQ;
