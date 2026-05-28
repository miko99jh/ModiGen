model PIController
  parameter Real waterLevel(min=0) = 0.2; //initial water level
  parameter Real target_height = 1; //target height
  parameter Real Kp = 1; //proportional coefficient
  parameter Real Ki = 0.5; //integral coefficient
  Real error; //height error
  Real Pcontrol; //proportional control
  Real Icontrol; //integral control
  Real waterLevel_dot; //derivative of water level
initial equation
  error = target_height - waterLevel;
equation
  //define the proportional control
  Pcontrol = Kp * error;
  //define the integral control
  Icontrol = Ki * integral(error, 0);
  //define the derivative of water level
  waterLevel_dot = Pcontrol + Icontrol - 0.1; //leak rate is 0.1m/s
  //define the differential equation of water level
  der(waterLevel) = waterLevel_dot;
end PIController;