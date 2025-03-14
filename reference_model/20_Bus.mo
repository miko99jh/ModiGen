model Bus "Bus model"
  extends PowerGrids.Icons.Bus(VPuIcon = port.VPu, UIcon = port.U, UPhaseIcon = port.UPhase);
  extends PowerGrids.Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu);
  extends PowerGrids.Electrical.BaseClasses.OnePortAC(
    final SNom = 1,
    final PStart = 0,
    final QStart = 0,
    final hasSubPF,
    final localInit,
    final isLinear = true,
    redeclare PowerGrids.Electrical.PowerFlow.BusPF componentPF(
      UNom = UNom));

equation
  port.i = Complex(0);
end Bus;
