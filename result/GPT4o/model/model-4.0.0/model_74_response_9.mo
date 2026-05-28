model Brush
 extends Modelica.Electrical.Polyphase.Interfaces.TwoPlug;
  parameter Modelica.Electrical.Machines.Losses.BrushParameters brushParameters;
  
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialConditionalHeatPort(
    useHeatPort=false, 
    final T=293.15);

  Modelica.Electrical.Machines.Losses.DCMachines.Brush brush[3](
    each final brushParameters=brushParameters, 
    each final useHeatPort=true);

equation
  // Electrical connections
  for i in 1:3 loop
    connect(plug_p.pin[i], brush[i].p);
    connect(brush[i].n, plug_n.pin[i]);
  end for;

  // Thermal feedback connections
  for j in 1:3 loop
    connect(brush[j].heatPort, internalHeatPort);
  end for;

end Brush;