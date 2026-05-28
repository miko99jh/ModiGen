model PQBus
 // Extending necessary components and interfaces
  extends PowerGrids.Icons.Load(
    PIcon = port.P,
    QIcon = port.Q,
    PPuIcon = port.PPu,
    QPuIcon = port.QPu);
  extends PowerGrids.Electrical.BaseClasses.SolutionChecking(
    VPuCheck = port.VPu,
    IPuCheck = port.IPu);
  extends PowerGrids.Electrical.BaseClasses.OnePortACPF(
    final portVariablesPhases = true);

  // Parameters for active and reactive power
  parameter PowerGrids.Types.ActivePower P = SNom "Active power entering the bus";
  parameter PowerGrids.Types.ReactivePower Q = 0 "Reactive power entering the bus";

  // Equations for power flow conservation
  equation
    port.P = P;
    port.Q = Q;
end PQBus;