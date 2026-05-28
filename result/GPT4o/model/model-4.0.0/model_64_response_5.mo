model CellStack
 extends Modelica.Electrical.Batteries.BaseClasses.BaseCellStack(
    final r0(R = Ns * cellData.Ri / Np)
  );

  // Redeclare cellData parameter
  redeclare Modelica.Electrical.Batteries.ParameterRecords.CellData cellData;

  // Connections
  equation
    connect(r0.n, n);
end CellStack;