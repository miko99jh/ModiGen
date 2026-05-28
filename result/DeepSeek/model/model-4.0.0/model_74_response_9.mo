model Brush
  extends Modelica.Electrical.Polyphase.Interfaces.TwoPlug;
  parameter Modelica.Electrical.Machines.Losses.BrushParameters brushParameters;
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialConditionalHeatPort(useHeatPort=false, final T=293.15);
  Modelica.Electrical.Machines.Losses.DCMachines.Brush brush[3] annotation(final brushParameters=brushParameters, final useHeatPort=true);
  equation 
  for j in 1:3 loop
    connect(brush[j].p, plug_p.pin[j]) annotation(Line(color={0,0.5,0}, smooth=Smooth.None));
    connect(brush[j].n, plug_n.pin[j]) annotation(Line(color={0,0.5,0}, smooth=Smooth.None));
    connect(brush[j].heatPort, internalHeatPort) annotation(Line(color={0.5,0,0}, smooth=Smooth.None));
  end for;
end Brush;