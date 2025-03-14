model Test_TwoPolesTwoZeroes_Dis
  IndustrialControlSystems.LinearSystems.Discrete.TwoPolesTwoZeroes
    tp2z_model(mu=1,T1=4,T2=2,T3=10,y_start=0,Ts=0.5);
  Modelica.Blocks.Sources.Step stepSignal(height=2, startTime=10);
equation
  connect(stepSignal.y,tp2z_model.u) ;
end Test_TwoPolesTwoZeroes_Dis;
