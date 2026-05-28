model PQBus
  extends PowerGrids.Icons.Load,
       PowerGrids.Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu),
       PowerGrids.Electrical.BaseClasses.OnePortACPF(portVariablesPhases = true);
  parameter PowerGrids.Types.ActivePower P = SNom "Active Power";
  parameter PowerGrids.Types.ReactivePower Q = 0 "Reactive Power";
equation
  port.P = P;
  port.Q = Q;
end PQBus;