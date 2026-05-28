model Brush
  extends Modelica.Electrical.Polyphase.Interfaces.TwoPlug;
  parameter Modelica.Electrical.Machines.Losses.BrushParameters brushParameters;
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialConditionalHeatPort(useHeatPort=false, final T=293.15);
  Modelica.Electrical.Machines.Losses.DCMachines.Brush brush[3] annotation(Placement(transformation(extent={{-10,-10},{-10,10}})));

equation
  annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}), graphics), Icon(coordinateSystem(extent={{-100,100},{100,-100}}), graphics));
  connect(plug_p.pin, brush.p);
  connect(brush.n, plug_n.pin);
  for j in 1:3 loop
    connect(brush[j].heatPort, internalHeatPort);
  end for;
end Brush;