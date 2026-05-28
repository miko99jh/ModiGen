model CurrentControlledDCPM
 extends Modelica.Electrical.Machines.Examples.ControlledDCDrives.Utilities.PartialControlledDCPM;

  // Load torque source with quadratic speed dependency
  Modelica.Mechanics.Rotational.Sources.QuadraticSpeedDependentTorque loadTorque(
    tau_nominal = -driveData.tauNominal,
    TorqueDirection = false,
    w_nominal = driveData.motorData.wNominal) 
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));

  // Step source for torque input
  Modelica.Blocks.Sources.Step step(
    offset = 0,
    startTime = 0.2,
    height = driveData.tauNominal) 
    annotation (Placement(transformation(extent={{-30,10},{-10,30}})));

equation
  // Mechanical linkage: Connect load inertia to load torque
  connect(loadInertia.flange_b, loadTorque.flange) 
    annotation (Line(points={{0,0},{0,20}}, color={0,0,127}));

  // Control signal flow: Connect step output to torque-to-current transformation input
  connect(step.y, tau2i.u) 
    annotation (Line(points={{-20,20},{-10,20}}, color={0,0,127}));

  annotation (
    uses(Modelica(version="4.0.0")),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}))
  );
end CurrentControlledDCPM;