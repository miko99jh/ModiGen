model SquirrelCage
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort;
  parameter Modelica.Units.SI.Inductance Lrsigma "Rotor stray inductance per phase translated to stator";
  parameter Modelica.Units.SI.Resistance Rr "Rotor resistance per phase translated to stator at T_ref";
  parameter Modelica.Units.SI.Temperature T_ref=293.15 "Reference temperature";
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alpha=0 "Temperature coefficient of resistance at T_ref";
  Modelica.Units.SI.Resistance Rr_actual "Actual rotor resistance";
  Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_r;
  Modelica.Blocks.Interfaces.RealOutput i[2] "Currents out from the squirrel cage" 
    annotation (Quantity(quantity="ElectricCurrent", unit="A"), Dialog(group="Output"));
equation 
  assert((1 + alpha*(T_heatPort - T_ref)) >= Modelica.Constants.eps, "Temperature outside scope of model!");
  Rr_actual = Rr * (1 + alpha*(T_heatPort - T_ref));
  spacePhasor_r.v_ = Rr_actual * spacePhasor_r.i_ + Lrsigma * der(spacePhasor_r.i_);
  i[1] = -spacePhasor_r.i_.re;
  i[2] = -spacePhasor_r.i_.im;
  LossPower = 0.5 * (spacePhasor_r.i_.re^2 + spacePhasor_r.i_.im^2) * Rr_actual;
end SquirrelCage;