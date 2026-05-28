model CellStack
 extends Modelica.Electrical.Batteries.BaseClasses.BaseCellStack(
    final r0 = R
  );

  parameter Integer Ns = 1 "Number of cells in series";
  parameter Integer Np = 1 "Number of cells in parallel";
  parameter Modelica.Electrical.Batteries.ParameterRecords.CellData cellData 
    "Cell data record";

  final parameter Real R = Ns * cellData.Ri / Np 
    "Total internal resistance of the stack";

equation
  connect(r0.n, n);
end CellStack;