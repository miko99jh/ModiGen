model Bus
  extends PowerGrids.Icons.Bus,
        PowerGrids.Electrical.BaseClasses.SolutionChecking,
        PowerGrids.Electrical.BaseClasses.OnePortAC;
  equation
    port.i = Complex(0);
end Bus;