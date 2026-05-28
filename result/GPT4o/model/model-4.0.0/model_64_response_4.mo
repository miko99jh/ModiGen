model CellStack
 extends Modelica.Electrical.Batteries.BaseClasses.BaseCellStack(
    final r0 = R,
    redeclare Modelica.Electrical.Batteries.ParameterRecords.CellData cellData);

  parameter Integer Ns = 1 "Number of cells in series";
  parameter Integer Np = 1 "Number of cells in parallel";
  parameter Real R = Ns * cellData.Ri / Np "Total internal resistance";

equation
  connect(r0.n, n);
end CellStack;