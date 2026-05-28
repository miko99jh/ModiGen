block ToDQ
 extends Modelica.Blocks.Interfaces.MIMO(final nin = m, final nout = 2);

  // Parameters
  parameter Integer m(min=1) = 3 "Number of phases";
  parameter Integer p "Number of pole pairs";

  // Components
  Modelica.Blocks.Math.Gain toGamma(final k = p) "Gain block to calculate electrical angle";
  Modelica.Electrical.Machines.SpacePhasors.Blocks.Rotator rotator "Rotator block for space phasor";
  Modelica.Blocks.Interfaces.RealInput phi(unit = "rad") "Mechanical angle input";
  Modelica.Electrical.Machines.SpacePhasors.Blocks.ToSpacePhasor toSpacePhasor(final m = m) "Block to convert to space phasor";

equation
  // Angle Processing
  connect(phi, toGamma.u) "Connect mechanical angle to gain block";
  connect(toGamma.y, rotator.phi) "Connect electrical angle to rotator";

  // Coordinate Transformation
  connect(u, toSpacePhasor.u) "Connect multi-phase input to space phasor block";

  // Vector Rotation
  connect(toSpacePhasor.y, rotator.u) "Connect stationary space phasor to rotator";

  // Final Output
  connect(rotator.y, y) "Connect rotated phasor to block output";

end ToDQ;