model FirstOrderExperiment1 "Defining experimental conditions"
  Real x "State variable";
initial equation
  x = 2 "Used before simulation to compute initial values";
equation
  der(x) = 1-x "Drives value of x toward 1.0";
  annotation(experiment(StartTime=0,StopTime=10));
end FirstOrderExperiment1;
