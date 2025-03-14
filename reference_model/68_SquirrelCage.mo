model SquirrelCage1 "Squirrel Cage"
  parameter Modelica.Units.SI.Inductance Lrsigma
 "Rotor stray inductance per phase translated to stator";
  parameter Modelica.Units.SI.Resistance Rr
 "Rotor resistance per phase translated to stator at T_ref";
  parameter Modelica.Units.SI.Temperature T_ref=293.15
 "Reference temperature";
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alpha=0
 "Temperature coefficient of resistance at T_ref";
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T=T_ref);
  Modelica.Units.SI.Resistance Rr_actual
 "Actual resistance = Rr*(1 + alpha*(T_heatPort - T_ref))";
  Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_r
 ;
  Modelica.Blocks.Interfaces.RealOutput i[2](
 each final quantity="ElectricCurrent",
 each final unit="A") = -spacePhasor_r.i_
 "Currents out from squirrel cage";
equation
  assert((1 + alpha*(T_heatPort - T_ref)) >= Modelica.Constants.eps,
 "Temperature outside scope of model!");
  Rr_actual = Rr*(1 + alpha*(T_heatPort - T_ref));
  spacePhasor_r.v_ = Rr_actual*spacePhasor_r.i_ + Lrsigma*der(
 spacePhasor_r.i_);
  2/3*LossPower = Rr_actual*(spacePhasor_r.i_[1]*spacePhasor_r.i_[1] +
 spacePhasor_r.i_[2]*spacePhasor_r.i_[2])
  ;
end SquirrelCage1;
