model Test_TwoPolesTwoZeroes
  IndustrialControlSystems.LinearSystems.Continuous.TwoPolesTwoZeroes
    TwoPolesTwoZeroes(mu=1, T1=4, T2=2, T3=10, y_start=0);
  Modelica.Blocks.Sources.Step stepSignal(height=2, startTime=10);
equation
  connect(stepSignal.y, TwoPolesTwoZeroes.u);
end Test_TwoPolesTwoZeroes;
