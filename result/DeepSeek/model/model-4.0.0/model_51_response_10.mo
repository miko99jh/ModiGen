model Resistor
 extends Modelica.Icons.Example;
  parameter Modelica.SIunits.Resistance R=100 "Resistance";
  parameter Modelica.SIunits.TemperatureDifference alpha=1e-3 "Temperature coefficient";
  parameter Modelica.SIunits.Temperature T_ref=293.15 "Reference temperature";
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R, alpha=alpha, T_ref=T_ref, i(start=0), useHeatPort=true);
  Modelica.Electrical.Analog.Sources.SineVoltage1 sineVoltage(V=220, f=1);
  Modelica.Electrical.Analog.Basic.G ground;
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=50);
  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=20);
equation 
  connect(sineVoltage.p, resistor.p);
  connect(sineVoltage.n, ground.p);
  connect(resistor.n, ground.p);
  connect(resistor.heatPort, thermalConductor.port_a);
  connect(thermalConductor.port_b, fixedTemperature.port);
end Resistor;