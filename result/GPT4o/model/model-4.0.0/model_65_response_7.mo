model StackRC
 extends Modelica.Electrical.Batteries.BaseClasses.BaseStackWithSensors(
    redeclare Modelica.Electrical.Batteries.ParameterRecords.TransientData.StackData stackData,
    redeclare Modelica.Electrical.Batteries.BatteryStacksWithSensors.CellRC cell(
      cellData = stackData.cellData,
      SOC0 = SOC0,
      each SOCtolerance = SOCtolerance,
      each useHeatPort = useHeatPort,
      each T = T
    )
  );

  extends Modelica.Electrical.Batteries.Icons.TransientModel;

  // Parameters
  parameter Real SOC0 = 0.5 "Initial state of charge";
  parameter Real SOCtolerance = 0.01 "Tolerance for state of charge";
  parameter Boolean useHeatPort = false "Enable heat port";
  parameter Real T = 298.15 "Initial temperature in Kelvin";

  // Additional components and equations can be added here if needed

end StackRC;