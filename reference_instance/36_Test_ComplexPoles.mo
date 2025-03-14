model Test_ComplexPoles
  IndustrialControlSystems.LinearSystems.Continuous.ComplexPoles complexPoles(xi = 0.4, omegan = 1, mu = 2, y_start = 0, dy_start = 0);
  Modelica.Blocks.Sources.Step stepSignal(height=2, startTime=10) ;
equation
  connect(stepSignal.y, complexPoles.u);
end Test_ComplexPoles;
