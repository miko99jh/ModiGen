model Resistor
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=100, alpha=1e-3, T_ref=293.15, i(start=0), useHeatPort=true);
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=220, f=1, n=resistor.p);
  Modelica.Electrical.Analog.Basic.Ground G;
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=50);
  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=20);
equation 
  // Electrical Circuit
  sineVoltage.p = resistor.p;
  sineVoltage.n = G.p;
  
  // Thermal Network
  resistor.heatPort.T = thermalConductor.port_a.T;
  thermalConductor.port_b.T = fixedTemperature.port.T;
end Resistor;