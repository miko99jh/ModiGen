model Test_TransferFunction
  IndustrialControlSystems.LinearSystems.Continuous.TransferFunction transferFunction(num={-1,1},den={2,4,1},y_start=0);
  Modelica.Blocks.Sources.Step stepSignal(height=2, startTime=10) ;
equation
  connect(stepSignal.y, transferFunction.u) ;
end Test_TransferFunction;
