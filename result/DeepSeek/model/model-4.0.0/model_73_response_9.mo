model CurrentControlledDCPM
  extends Modelica.Electrical.Machines.Examples.ControlledDCDrives.Utilities.PartialControlledDCPM;
  Modelica.Mechanics.Rotational.Sources.QuadraticSpeedDependentTorque loadTorque(
      tau_nominal = -driveData.tauNominal,
      TorqueDirection = false,
      w_nominal = driveData.motorData.wNominal);
  Modelica.Blocks.Sources.Step step(offset = 0, startTime = 0.2, height = driveData.tauNominal);
protected 
  Modelica.Mechanics.Rotational.Components.RackAndPinion rackAndPinion;
public 
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b = loadTorque.flange_b;
equation 
  connect(loadTorque.flange_a, rackAndPinion.flange_a);
  connect(step.y, tau2i.u);
end CurrentControlledDCPM;