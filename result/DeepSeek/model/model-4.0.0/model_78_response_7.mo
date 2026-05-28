block ToDQ extends Modelica.Blocks.Interfaces.MIMO
  parameter Integer m(min=1) = 3;
  parameter Integer p;
  Modelica.Blocks.Math.Gain toGamma(k=p);
  Modelica.Electrical.Machines.SpacePhasors.Blocks.Rotator rotator;
  Modelica.Blocks.Interfaces.RealInput phi(unit="rad");
  Modelica.Electrical.Machines.SpacePhasors.Blocks.ToSpacePhasor toSpacePhasor(m=m);
  Modelica.Blocks.Interfaces.RealOutput y[2];
equation 
  connect(phi, toGamma.u);
  connect(toGamma.y, rotator.w);
  connect(u[:,1:m], toSpacePhasor.u);
  connect(toSpacePhasor.y, rotator.u);
  connect(rotator.y, y);
end ToDQ;