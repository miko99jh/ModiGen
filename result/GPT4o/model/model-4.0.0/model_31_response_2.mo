model ShiftSample
 // Import necessary Modelica libraries
  import Modelica.Clocked.ClockSignals.Clocks.PeriodicExactClock;
  import Modelica.Clocked.ClockSignals.Sampler.ShiftSample;
  import Modelica.Clocked.RealSignals.Sampler.SampleClocked;
  import Modelica.Blocks.Sources.Sine;
  import Modelica.Clocked.Types.Resolution;

  // Components
  PeriodicExactClock periodicClock(factor=20, resolution=Resolution.ms) 
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  
  ShiftSample shiftSample1(shiftCounter=4, resolution=3) 
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  
  SampleClocked sample1 
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  
  Sine sineSource(frequency=2, offset=0.1, startTime=0) 
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));

equation
  // Connect the periodic clock to the shift sample block
  connect(periodicClock.y, shiftSample1.u) 
    annotation (Line(points={{-60,50},{-40,50}}, color={0,0,127}));
  
  // Connect the shifted clock signal to the sample clocked block
  connect(shiftSample1.y, sample1.clock) 
    annotation (Line(points={{-20,50},{0,50}}, color={0,0,127}));
  
  // Connect the sine source to the sample clocked block
  connect(sineSource.y, sample1.u) 
    annotation (Line(points={{-60,0},{0,0},{0,40}}, color={0,0,127}));

  // Output the sampled signal
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
              Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end ShiftSample;