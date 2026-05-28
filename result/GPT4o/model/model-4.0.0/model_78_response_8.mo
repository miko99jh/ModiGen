block ToDQ
 extends Modelica.Blocks.Interfaces.MIMO(final nin=m, final nout=2);

  parameter Integer m(min=1) = 3 "Number of phases";
  parameter Integer p "Number of pole pairs";

  Modelica.Blocks.Math.Gain toGamma(final k=p) "Gain block to calculate electrical angle";
  Modelica.Electrical.Machines.SpacePhasors.Blocks.Rotator rotator "Block to rotate space phasor";
  Modelica.Blocks.Interfaces.RealInput phi(unit="rad") "Input for mechanical angle";
  Modelica.Electrical.Machines.SpacePhasors.Blocks.ToSpacePhasor toSpacePhasor(final m=m) "Block to convert to space phasor";

equation
  // Angle Processing: Calculate electrical angle
  connect(phi, toGamma.u);
  
  // Coordinate Transformation: Convert multi-phase input to space phasor
  connect(u, toSpacePhasor.u);
  
  // Vector Rotation: Rotate space phasor to rotor-fixed frame
  connect(toSpacePhasor.y, rotator.u);
  connect(toGamma.y, rotator.phi);
  
  // Final Output: Output the rotated phasor
  connect(rotator.y, y);
end ToDQ;