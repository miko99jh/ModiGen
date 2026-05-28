model SecondOrderSystem
  import Modelica.SIunits.*;
  parameter Angle phi1_init=0;
  parameter Angle phi2_init=1;
  parameter AngularVelocity omega1_init=0;
  parameter AngularVelocity omega2_init=0;
  parameter Inertia J1=0.4;
  parameter Inertia J2=1.0;
  parameter RotationalSpringConstant c1=11;
  parameter RotationalDampingConstant d1=0.2;
  parameter RotationalSpringConstant c2=5;
  parameter RotationalDampingConstant d2=1.0;
  Angle phi1(start=phi1_init);
  Angle phi2(start=phi2_init);
  AngularVelocity omega1(start=omega1_init);
  AngularVelocity omega2(start=omega2_init);
equation
  der(phi1) = omega1;
  der(phi2) = omega2;
  J1*der(omega1) = -c1*(phi2-phi1) - d1*(omega2-omega1);
  J2*der(omega2) = c2*(phi1-phi2) + d2*(omega1-omega2);
end SecondOrderSystem;