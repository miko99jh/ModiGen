model CurrentControlledDCPM1
  "Current controlled DC PM drive with H-bridge from battery"
  extends Modelica.Electrical.Machines.Examples.ControlledDCDrives.Utilities.PartialControlledDCPM;
  Modelica.Mechanics.Rotational.Sources.QuadraticSpeedDependentTorque
 loadTorque(
 tau_nominal=-driveData.tauNominal,
 TorqueDirection=false,
 w_nominal=driveData.motorData.wNominal);
  Modelica.Blocks.Sources.Step step(
 offset=0,
 startTime=0.2,
 height=driveData.tauNominal);
equation
  connect(loadInertia.flange_b, loadTorque.flange);
  connect(step.y, tau2i.u);
end CurrentControlledDCPM1;
