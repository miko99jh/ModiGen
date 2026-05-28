model Resistor
 extends Modelica.Icons.Example;

  // Electrical components
  Modelica.Electrical.Analog.Basic.Resistor resistor(
    R=100, 
    alpha=1e-3, 
    T_ref=293.15, 
    i(start=0), 
    useHeatPort=true) "Resistor with thermal effects";

  Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1(
    V=220, 
    f=1) "Sine voltage source";

  Modelica.Electrical.Analog.Basic.Ground G "Electrical ground";

  // Thermal components
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(
    G=50) "Thermal conductor";

  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(
    T=20 + 273.15) "Fixed temperature source at 20°C";

equation 
  // Electrical connections
  connect(SineVoltage1.p, resistor.p);
  connect(resistor.n, G.p);
  connect(SineVoltage1.n, G.p);

  // Thermal connections
  connect(resistor.heatPort, thermalConductor.port_a);
  connect(thermalConductor.port_b, fixedTemperature.port);

end Resistor;