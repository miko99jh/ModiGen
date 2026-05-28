model CellStack
 extends Modelica.Electrical.Batteries.BaseClasses.BaseCellStack(
    final r0 = R
  );

  parameter Integer Ns = 1 "Number of cells in series";
  parameter Integer Np = 1 "Number of cells in parallel";
  parameter Modelica.Electrical.Batteries.ParameterRecords.CellData cellData 
    "Cell data including open-circuit voltage, inner resistance, etc.";

  // Calculate the total internal resistance
  final parameter Real R = Ns * cellData.Ri / Np "Total internal resistance";

equation
  // Connect the internal resistance to the negative terminal
  connect(r0.n, n);
end CellStack;