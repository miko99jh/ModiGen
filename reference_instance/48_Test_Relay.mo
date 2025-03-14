model Test_Relay1
  IndustrialControlSystems.Controllers.Logic.Relay relay1(Ts=0.2);
  Modelica.Blocks.Sources.Sine sine1(f=1, amplitude=1);
equation
  connect(sine1.y, relay1.u) ;
end Test_Relay1;
