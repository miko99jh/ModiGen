model SecondOrderSystem
 import Modelica.SIunits.*;

  // Parameters
  parameter Angle phi1_init = 0 "Initial angle of the first inertia";
  parameter Angle phi2_init = 1 "Initial angle of the second inertia";
  parameter AngularVelocity omega1_init = 0 "Initial angular velocity of the first inertia";
  parameter AngularVelocity omega2_init = 0 "Initial angular velocity of the second inertia";
  parameter Inertia J1 = 0.4 "Inertia of the first rotor";
  parameter Inertia J2 = 1.0 "Inertia of the second rotor";
  parameter RotationalSpringConstant c1 = 11 "Rotational spring constant between the two rotors";
  parameter RotationalSpringConstant c2 = 5 "Rotational spring constant grounding the second rotor";
  parameter RotationalDampingConstant d1 = 0.2 "Rotational damping constant between the two rotors";
  parameter RotationalDampingConstant d2 = 1.0 "Rotational damping constant grounding the second rotor";

  // Variables
  Angle phi1 "Angle of the first inertia";
  Angle phi2 "Angle of the second inertia";
  AngularVelocity omega1 "Angular velocity of the first inertia";
  AngularVelocity omega2 "Angular velocity of the second inertia";

initial equation
  // Set initial conditions
  phi1 = phi1_init;
  phi2 = phi2_init;
  omega1 = omega1_init;
  omega2 = omega2_init;

equation
  // Kinematics
  der(phi1) = omega1;
  der(phi2) = omega2;

  // Kinetics
  J1 * der(omega1) = -c1 * (phi1 - phi2) - d1 * (omega1 - omega2);
  J2 * der(omega2) = c1 * (phi1 - phi2) + d1 * (omega1 - omega2) - c2 * phi2 - d2 * omega2;

end SecondOrderSystem;