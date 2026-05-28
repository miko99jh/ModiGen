model CurrentControlledDCPM
  extends Modelica.Electrical.Machines.Examples.ControlledDCDrives.Utilities.PartialControlledDCPM;
  Modelica.Mechanics.Rotational.Sources.QuadraticSpeedDependentTorque loadTorque(
      tau_nominal = -driveData.tauNominal,
      TorqueDirection = false,
      w_nominal = driveData.motorData.wNominal);
  Modelica.Blocks.Sources.Step step(offset = 0, startTime = 0.2, height = driveData.tauNominal);

protected 
  Modelica.Mechanics.Rotational.Interfaces.Flange_b loadConnection;

equation 
  connect(loadTorque.flange, loadInertia.flange_b);
  connect(step.y, tau2i.u);
end CurrentControlledDCPM;