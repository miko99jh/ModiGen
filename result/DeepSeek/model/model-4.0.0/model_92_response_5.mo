model PDController
  parameter Real Kp = 1 "Proportional coefficient";
  parameter Real Kd = 0.1 "Differential coefficient";
  parameter Real target_height = 1 "Target height";
  parameter Real initial_waterLevel = 0.2 "Initial water level";
  Real waterLevel(start = initial_waterLevel) "Water level";
  Real error "Error";
  Real Pcontrol "Proportional control";
  Real Dcontrol "Differential control";
  Real d_waterLevel_dt "Derivative of water level";
equation 
  // Define the error
  error = target_height - waterLevel;
  
  // Define the proportional control
  Pcontrol = Kp*error;
  
  // Define the differential control
  // TODO: Implement the differential control
  
  // Define the differential of the water level
  // TODO: Implement the derivative of the water level
  
  // Define the differential equation of the water level
  // TODO: Implement the differential equation of the water level
  
  // Define the output
  // TODO: Implement the output
end PDController;