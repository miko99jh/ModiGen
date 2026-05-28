model CellStack
  extends Modelica.Electrical.Batteries.BaseClasses.BaseCellStack(
    redeclare final parameter Modelica.Electrical.Batteries.ParameterRecords.CellData cellData,
    redeclare final parameter Modelica.SIunits.Resistance r0 = R,
    final parameter Modelica.SIunits.Resistance R = Ns*cellData.Ri/Np);
equation
  connect(r0.n, n);
end CellStack;