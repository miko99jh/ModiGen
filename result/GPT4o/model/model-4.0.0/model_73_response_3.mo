model CurrentControlledDCPM
 extends Modelica.Electrical.Machines.Examples.ControlledDCDrives.Utilities.PartialControlledDCPM;

  // Parameters
  parameter Modelica.Electrical.Machines.Examples.ControlledDCDrives.Utilities.DriveData driveData;

  // Components
  Modelica.Mechanics.Rotational.Sources.QuadraticSpeedDependentTorque loadTorque(
    tau_nominal = -driveData.tauNominal,
    TorqueDirection = false,
    w_nominal = driveData.motorData.wNominal) "Quadratic speed-dependent torque source for load";

  Modelica.Blocks.Sources.Step step(
    offset = 0,
    startTime = 0.2,
    height = driveData.tauNominal) "Step source for torque input";

equation
  // Mechanical linkage
  connect(loadInertia.flange_b, loadTorque.flange) "Connect load inertia to load torque source";

  // Control signal flow
  connect(step.y, tau2i.u) "Connect step output to torque-to-current transformation input";

end CurrentControlledDCPM;