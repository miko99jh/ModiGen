model CellStack
  extends Modelica.Electrical.Batteries.BaseClasses.BaseCellStack(
    redeclare parameter Modelica.Electrical.Batteries.ParameterRecords.CellData cellData,
    final parameter Real R = Ns*cellData.Ri/Np,
    final parameter Real r0 = R);

equation
  connect(r0.n, n);
end CellStack;