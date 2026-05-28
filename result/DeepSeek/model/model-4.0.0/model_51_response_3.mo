model Resistor
  extends Modelica.Icons.Example;
  parameter Modelica.SIunits.Resistance R(start=100) = 100 "Resistance";
  parameter Real alpha(start=1e-3) = 1e-3 "Temperature coefficient";
  parameter Modelica.SIunits.Temperature T_ref(start=293.15) = 293.15 "Reference temperature";
  Modelica.Electrical.Analog.Sources.SineVoltage1 sineVoltage1(V=220, f=1, n=resistor.n, p=resistor.p);
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R, alpha=alpha, T_ref=T_ref, i(start=0), useHeatPort=true);
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=50);
  Modelica.Thermal.HeatTransfer.Celsius.FixedTemperature fixedTemperature(T=20);
equation 
  connect(sineVoltage1.p, resistor.p);
  connect(sineVoltage1.n, resistor.n);
  connect(resistor.heatPort, thermalConductor.port_a);
  connect(thermalConductor.port_b, fixedTemperature.port);
end Resistor;