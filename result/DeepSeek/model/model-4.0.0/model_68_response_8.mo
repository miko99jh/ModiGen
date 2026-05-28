model SquirrelCage
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort;
  parameter Modelica.Units.SI.Inductance Lrsigma 
    "Rotor stray inductance per phase translated to stator";
  parameter Modelica.Units.SI.Resistance Rr 
    "Rotor resistance per phase translated to stator at T_ref";
  parameter Modelica.Units.SI.Temperature T_ref 
    "Reference temperature" = 293.15 K;
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alpha 
    "Temperature coefficient of resistance at T_ref" = 0;
  Modelica.Units.SI.Resistance Rr_actual 
    "Actual rotor resistance";
  Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_r 
    "Rotor space phasor";
  Modelica.Blocks.Interfaces.RealOutput i[2] 
    "Currents out from the squirrel cage";
equation 
  assert((1 + alpha*(T_heatPort - T_ref)) >= Modelica.Constants.eps, 
    "Temperature outside scope of model!");
  Rr_actual = Rr * (1 + alpha*(T_heatPort - T_ref));
  spacePhasor_r.v_ = Rr_actual * spacePhasor_r.i_ + Lrsigma * der(spacePhasor_r.i_);
  LossPower = 0.5 * (2/3) * (spacePhasor_r.i_[1]^2 + spacePhasor_r.i_[2]^2);
  i[1] = -spacePhasor_r.i_[1];
  i[2] = -spacePhasor_r.i_[2];
end SquirrelCage;