model Hold
 extends Modelica.Icons.Example;

  // Components
  Modelica.Blocks.Sources.BooleanTable table(
    table=[0.05, 0.15]
  ) annotation (Placement(transformation(extent={{-90,60},{-70,80}})));

  Modelica.Clocked.BooleanSignals.Sampler.SampleClocked sample1
    annotation (Placement(transformation(extent={{-30,60},{-10,80}})));

  Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock periodicClock(
    factor=20, 
    resolution=Modelica.Clocked.Types.Resolution.ms
  ) annotation (Placement(transformation(extent={{-90,20},{-70,40}})));

  Modelica.Clocked.BooleanSignals.Sampler.Hold hold1(
    y_start=false
  ) annotation (Placement(transformation(extent={{30,60},{50,80}})));

  Modelica.Clocked.BooleanSignals.Sampler.ShiftSample shiftSample1(
    shiftCounter=2
  ) annotation (Placement(transformation(extent={{0,60},{20,80}})));

equation
  // Clocking & Sampling
  connect(periodicClock.y, sample1.clock) 
    annotation (Line(points={{-70,30},{-20,30},{-20,70}}, color={0,0,127}));

  connect(table.y, sample1.u) 
    annotation (Line(points={{-70,70},{-30,70}}, color={0,0,127}));

  // Signal Delay
  connect(sample1.y, shiftSample1.u) 
    annotation (Line(points={{-10,70},{10,70}}, color={0,0,127}));

  // Re-conversion
  connect(shiftSample1.y, hold1.u) 
    annotation (Line(points={{20,70},{30,70}}, color={0,0,127}));

  annotation (
    uses(Modelica(version="4.0.0")),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}))
  );
end Hold;