model SecondOrderSystem
  import Modelica.SIunits.*;
  parameter Angle phi1_init=0 "Initial angle of first rotor";
  parameter Angle phi2_init=1 "Initial angle of second rotor";
  parameter AngularVelocity omega1_init=0 "Initial angular velocity of first rotor";
  parameter AngularVelocity omega2_init=0 "Initial angular velocity of second rotor";
  parameter Inertia J1=0.4 "Inertia of first rotor";
  parameter Inertia J2=1.0 "Inertia of second rotor";
  parameter RotationalSpringConstant c1=11 "Spring constant of first rotor";
  parameter RotationalSpringConstant c2=5 "Spring constant of second rotor";
  parameter RotationalDampingConstant d1=0.2 "Damping constant of first rotor";
  parameter RotationalDampingConstant d2=1.0 "Damping constant of second rotor";
  Angle phi1(start=phi1_init);
  Angle phi2(start=phi2_init);
  AngularVelocity omega1(start=omega1_init);
  AngularVelocity omega2(start=omega2_init);
equation 
  // Kinematics
  der(phi1) = omega1;
  der(phi2) = omega2;
  // Kinetics
  J1 * der(omega1) = -c1 * (phi2 - phi1) - d1 * (omega2 - omega1);
  J2 * der(omega2) = c2 * (phi1 - phi2) - d2 * (omega1 - omega2);
  // Coupling
end SecondOrderSystem;