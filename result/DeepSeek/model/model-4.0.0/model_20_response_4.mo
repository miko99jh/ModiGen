model Bus
  extends PowerGrids.Icons.Bus,
       PowerGrids.Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu),
       PowerGrids.Electrical.BaseClasses.OnePortAC(SNom = 1, PStart = 0, QStart = 0, hasSubPF = false, localInit = false, isLinear = true, redeclare PowerGrids.Electrical.PowerFlow.BusPF componentPF(UNom = UNom));
equation
  port.i = Complex(0);
end Bus;