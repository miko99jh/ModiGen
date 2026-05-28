model Bus
  extends PowerGrids.Icons.Bus,
       PowerGrids.Electrical.BaseClasses.SolutionChecking(VPuCheck = port.VPu, IPuCheck = port.IPu),
       PowerGrids.Electrical.BaseClasses.OnePortAC(SNom = 1, PStart = 0, QStart = 0, hasSubPF = true, localInit = true, isLinear = true, 
       redeclare model componentPF = PowerGrids.Electrical.PowerFlow.BusPF(UNom = UNom));
equation
  port.i = Complex(0);
end Bus;