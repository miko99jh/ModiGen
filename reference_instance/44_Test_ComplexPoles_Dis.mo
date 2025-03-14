model Test_ComplexPoles_Dis
  IndustrialControlSystems.LinearSystems.Discrete.ComplexPoles ComplexPoles(xi=0.4,omegan=1,mu=2,y_start=0,dy_start=0,Ts=0.5) ;
  Modelica.Blocks.Sources.Step stepSignal(height=2, startTime=10);
equation
  connect(stepSignal.y, ComplexPoles.u);
end Test_ComplexPoles_Dis;
