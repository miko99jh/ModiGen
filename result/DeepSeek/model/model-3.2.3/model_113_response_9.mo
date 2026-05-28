model RLC_Simulation
 parameter Real startTime = 0 "Start time of simulation";
  parameter Real stopTime = 0.1 "Stop time of simulation";
  parameter Real fixedStep = 0.001 "Fixed step size of simulation";
  RLC rlc;
equation 
  connect(rlc.rlc_comp, rlc);
  annotation(experiment(StartTime = startTime, StopTime = stopTime, FixedStep = fixedStep));
end RLC_Simulation;