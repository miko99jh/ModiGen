model Brush
  extends Modelica.Electrical.Polyphase.Interfaces.TwoPlug;
  parameter Modelica.Electrical.Machines.Losses.BrushParameters brushParameters;
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialConditionalHeatPort(useHeatPort=false, final T=293.15);
  Modelica.Electrical.Machines.Losses.DCMachines.Brush brush[3] annotation (final brushParameters = brushParameters, final useHeatPort = true);

equation 
  // Electrical Circuit
  plug_p.pin.n = brush.p;
  brush.n = plug_n.pin.p;

  // Thermal Feedback
  for i in 1:3 loop
    brush[i].heatPort.port.H = internalHeatPort.port.H;
  end for;
end Brush;