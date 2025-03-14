model CellStack
  "Battery with open-circuit voltage dependent on state of charge, self-discharge and inner resistance"
  extends Modelica.Electrical.Batteries.BaseClasses.BaseCellStack(r0(final R=Ns*cellData.Ri/Np),
 redeclare Modelica.Electrical.Batteries.ParameterRecords.CellData cellData);
equation
  connect(r0.n, n);
end CellStack;
