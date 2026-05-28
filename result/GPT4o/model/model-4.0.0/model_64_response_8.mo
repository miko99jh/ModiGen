model CellStack
 extends Modelica.Electrical.Batteries.BaseClasses.BaseCellStack(
    final R = Ns * cellData.Ri / Np);

  redeclare Modelica.Electrical.Batteries.ParameterRecords.CellData cellData;

equation
  connect(r0.n, n);
end CellStack;