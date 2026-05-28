model DCMotor
 parameter Real R(unit="V/A") "Motor resistance";
  parameter Real L(unit="H") "Motor inductance";
  parameter Real J(unit="kg*m^2") "Moment of inertia";
  parameter Real Kt(unit="N*m/A") "Torque constant";
  parameter Real B(unit="N*m*s/rad") "Damping coefficient";

  Real i(unit="A") "Current through the motor";
  Real v(unit="V") "Voltage applied to the motor";
  Real omega(unit="rad/s") "Angular velocity of the motor";

equation 
  // Voltage equation
  v = R * i + L * der(i);

  // Torque equation
  J * der(omega) = Kt * i - B * omega;
end DCMotor;