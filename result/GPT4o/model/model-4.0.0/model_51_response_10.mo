model Resistor
 extends Modelica.Icons.Example;

  // Electrical components
  Modelica.Electrical.Analog.Basic.Resistor resistor(
    R=100, 
    alpha=1e-3, 
    T_ref=293.15, 
    i(start=0), 
    useHeatPort=true) "Resistor with thermal effects";
  
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage1(
    V=220, 
    f=1) "Sine voltage source with 220V amplitude and 1Hz frequency";
  
  Modelica.Electrical.Analog.Basic.Ground ground "Electrical ground";

  // Thermal components
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(
    G=50) "Thermal conductor with conductance 50 W/K";
  
  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(
    T=20) "Fixed temperature source set to 20°C";

equation
  // Electrical connections
  connect(sineVoltage1.p, resistor.p);
  connect(resistor.n, ground.p);
  connect(sineVoltage1.n, ground.p);

  // Thermal connections
  connect(resistor.heatPort, thermalConductor.port_a);
  connect(thermalConductor.port_b, fixedTemperature.port);
  
end Resistor;