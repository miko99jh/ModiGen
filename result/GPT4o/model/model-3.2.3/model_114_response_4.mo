model SecondOrderSystem
 import Modelica.SIunits.*;

  // Parameters
  parameter Angle phi1_init = 0 "Initial angle of rotor 1";
  parameter Angle phi2_init = 1 "Initial angle of rotor 2";
  parameter AngularVelocity omega1_init = 0 "Initial angular velocity of rotor 1";
  parameter AngularVelocity omega2_init = 0 "Initial angular velocity of rotor 2";
  parameter Inertia J1 = 0.4 "Inertia of rotor 1";
  parameter Inertia J2 = 1.0 "Inertia of rotor 2";
  parameter RotationalSpringConstant c1 = 11 "Spring constant between rotor 1 and rotor 2";
  parameter RotationalSpringConstant c2 = 5 "Spring constant grounding rotor 2";
  parameter RotationalDampingConstant d1 = 0.2 "Damping constant between rotor 1 and rotor 2";
  parameter RotationalDampingConstant d2 = 1.0 "Damping constant grounding rotor 2";

  // Variables
  Angle phi1 "Angle of rotor 1";
  Angle phi2 "Angle of rotor 2";
  AngularVelocity omega1 "Angular velocity of rotor 1";
  AngularVelocity omega2 "Angular velocity of rotor 2";

initial equation
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