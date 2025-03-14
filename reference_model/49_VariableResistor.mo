model VariableResistor1
  "Ideal linear electrical resistor with variable resistance"
  parameter Modelica.Units.SI.Temperature T_ref=300.15 "Reference temperature";
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alpha=0
    "Temperature coefficient of resistance (R_actual = R*(1 + alpha*(T_heatPort - T_ref))";
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T=T_ref);
  Modelica.Units.SI.Resistance R_actual
    "Actual resistance = R*(1 + alpha*(T_heatPort - T_ref))";
  Modelica.Blocks.Interfaces.RealInput R(unit="Ohm") annotation (Placement(
        transformation(
        origin={0,120},
        extent={{-20,-20},{20,20}},
        rotation=270), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
equation
  assert((1 + alpha*(T_heatPort - T_ref)) >= Modelica.Constants.eps,
    "Temperature outside scope of model!");
  R_actual = R*(1 + alpha*(T_heatPort - T_ref));
  v = R_actual*i;
  LossPower = v*i;
end VariableResistor1;
