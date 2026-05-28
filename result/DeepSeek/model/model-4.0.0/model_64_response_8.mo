model CellStack
  extends Modelica.Electrical.Batteries.BaseClasses.BaseCellStack(
    r0.r = R,
    cellData = Modelica.Electrical.Batteries.ParameterRecords.CellData);
  parameter Modelica.SIunits.Resistance R(min = 0) "Resistance";
equation 
  connect(r0.n, n);
end CellStack;