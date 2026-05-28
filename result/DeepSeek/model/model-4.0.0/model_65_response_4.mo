model StackRC
  extends Modelica.Electrical.Batteries.BaseClasses.BaseStackWithSensors(
    redeclare Modelica.Electrical.Batteries.ParameterRecords.TransientData.StackData stackData,
    cell = Modelica.Electrical.Batteries.BatteryStacksWithSensors.CellRC(
      cellData = stackData.cellData,
      SOC0 = SOC0,
      each SOCtolerance = SOCtolerance,
      each useHeatPort = useHeatPort,
      each T = T));
  extends Modelica.Electrical.Batteries.Icons.TransientModel;
end StackRC;