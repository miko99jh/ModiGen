model Resistor
  extends Modelica.Icons.Example;
  parameter Modelica.SIunits.Resistance R(start=100) = 100 "Resistance";
  parameter Modelica.SIunits.TemperatureCoefficient alpha(start=1e-3) = 1e-3 "Temperature coefficient";
  parameter Modelica.SIunits.Temperature T_ref(start=293.15) = 293.15 "Reference temperature";
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R, alpha=alpha, T_ref=T_ref, i(start=0), useHeatPort=true);
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=220, f=1, pin_p=resistor.p, pin_n=G.p);
  Modelica.Electrical.Analog.Basic.Ground G;
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=50);
  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=20);
equation 
  connect(resistor.p, sineVoltage.pin_p) annotation(line(color={0,0,128}, smooth=Smooth.None));
  connect(resistor.n, G.p) annotation(line(color={0,0,128}, smooth=Smooth.None));
  connect(resistor.heatPort, thermalConductor.port_a) annotation(line(color={0,0,128}, smooth=Smooth.None));
  connect(thermalConductor.port_b, fixedTemperature.port) annotation(line(color={0,0,128}, smooth=Smooth.None));
end Resistor;