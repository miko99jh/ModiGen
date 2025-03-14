model Test_RelayHysteresis
  IndustrialControlSystems.Controllers.Logic.RelayHysteresis relayHysteresis(Ts=0.2);
  Modelica.Blocks.Sources.Sine sine(amplitude=1, f=1);
equation
  connect(sine.y, relayHysteresis.u) ;
end Test_RelayHysteresis;
