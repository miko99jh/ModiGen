model CurrentControlledDCPM
 extends Modelica.Electrical.Machines.Examples.ControlledDCDrives.Utilities.PartialControlledDCPM;

  // Quadratic speed-dependent torque source for the load
  Modelica.Mechanics.Rotational.Sources.QuadraticSpeedDependentTorque loadTorque(
    tau_nominal = -driveData.tauNominal,
    TorqueDirection = false,
    w_nominal = driveData.motorData.wNominal) 
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));

  // Step source for the torque input
  Modelica.Blocks.Sources.Step step(
    offset = 0,
    startTime = 0.2,
    height = driveData.tauNominal) 
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));

equation 
  // Mechanical linkage: Connect load inertia to the load torque source
  connect(loadInertia.flange_b, loadTorque.flange) 
    annotation (Line(points={{-40,50},{-60,50}}, color={0,0,127}));

  // Control signal flow: Connect step output to torque-to-current transformation input
  connect(step.y, tau2i.u) 
    annotation (Line(points={{-60,-10},{-40,-10},{-40,0}}, color={0,127,0}));

annotation (
    Icon(coordinateSystem(preserveAspectRatio=true)),
    Diagram(coordinateSystem(preserveAspectRatio=true)));
end CurrentControlledDCPM;