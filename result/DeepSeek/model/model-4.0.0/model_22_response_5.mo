model PQBus
  extends PowerGrids.Icons.Load(PIcon = "port.P", QIcon = "port.Q", PPuIcon = "port.PPu", QPuIcon = "port.QPu"),
       PowerGrids.Electrical.BaseClasses.SolutionChecking(VPuCheck = "port.VPu", IPuCheck = "port.IPu"),
       PowerGrids.Electrical.BaseClasses.OnePortACPF(portVariablesPhases = true);

  parameter PowerGrids.Types.ActivePower P = SNom "Active power";
  parameter PowerGrids.Types.ReactivePower Q = 0 "Reactive power";

equation
  port.P = P;
  port.Q = Q;
end PQBus;