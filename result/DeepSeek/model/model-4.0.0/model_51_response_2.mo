model Resistor
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=100, alpha=1e-3, T_ref=293.15, i(start=0), useHeatPort=true);
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=220, f=1);
  Modelica.Electrical.Analog.Basic.Ground G;
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=50);
  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=20);
equation
  connect(sineVoltage.p, resistor.p);
  connect(sineVoltage.n, G.p);
  connect(resistor.n, G.p);
  connect(resistor.heatPort, thermalConductor.port_a);
  connect(thermalConductor.port_b, fixedTemperature.port);
end Resistor;