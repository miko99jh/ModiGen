model Resistor1 "Resistor with simple thermal network"
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Resistor resistor(
    R=100,
    alpha=1e-3,
    T_ref=293.15,
    i(start=0),
    useHeatPort=true);
  Modelica.Electrical.Analog.Basic.Ground G;
  Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1(V=220, f=1);
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=50);
  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=20);
  
equation
  connect(SineVoltage1.n, G.p);
  connect(resistor.heatPort, thermalConductor.port_a);
  connect(SineVoltage1.p, resistor.p);
  connect(G.p, resistor.n);
  connect(thermalConductor.port_b, fixedTemperature.port);
end Resistor1;
