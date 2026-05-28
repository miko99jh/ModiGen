model Brush
  extends Modelica.Electrical.Polyphase.Interfaces.TwoPlug;
  parameter Modelica.Electrical.Machines.Losses.BrushParameters brushParameters;
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialConditionalHeatPort(useHeatPort=false, final T=293.15);
  Modelica.Electrical.Machines.Losses.DCMachines.Brush brush[3] annotation(final brushParameters=brushParameters, final useHeatPort=true);

  equation
    connect(plug_p.pin, brush.p);
    connect(brush.n, plug_n.pin);
    for j in 1:3 loop
      connect(brush[j].heatPort, internalHeatPort);
    end for;
end Brush;