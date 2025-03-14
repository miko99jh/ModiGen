model Brush "Model considering voltage drop of carbon brushes"
  extends Modelica.Electrical.Polyphase.Interfaces.TwoPlug;
  parameter Modelica.Electrical.Machines.Losses.BrushParameters brushParameters
 "Brush loss parameters";
  extends Modelica.Thermal.HeatTransfer.Interfaces.PartialConditionalHeatPort(
 useHeatPort=false,final T=293.15);
  Modelica.Electrical.Machines.Losses.DCMachines.Brush brush[3](each final brushParameters=brushParameters,
 each final useHeatPort=true)
 ;
equation
  connect(plug_p.pin, brush.p) ;
  connect(brush.n, plug_n.pin) ;
  for j in 1:m loop
 connect(brush[j].heatPort, internalHeatPort) ;
  end for
  ;
end Brush;
