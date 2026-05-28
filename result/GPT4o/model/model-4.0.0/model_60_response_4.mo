model ZDiode
 extends Modelica.Electrical.Analog.Interfaces.OnePort;
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T=293.15);

  parameter Modelica.Units.SI.Current Ids = 1e-6 "Saturation current";
  parameter Modelica.Units.SI.Voltage Vt = 0.04 "Voltage equivalent of temperature (kT/qn)";
  parameter Real Maxexp(final min=Modelica.Constants.small) = 30 "Maximum exponent value";
  parameter Modelica.Units.SI.Resistance R = 1e8 "Resistance";
  parameter Modelica.Units.SI.Voltage Bv = 5.1 "Breakdown voltage";
  parameter Modelica.Units.SI.Current Ibv = 0.7 "Breakdown current";
  parameter Real Nbv = 0.74 "Breakdown voltage factor";
  parameter Real T = 293.15 "Temperature";

  Modelica.Units.SI.Current i "Current through the diode";
  Modelica.Units.SI.Voltage v "Voltage across the diode";
  Modelica.Units.SI.Power LossPower "Power loss in the diode";

equation
  // Define the current through the diode based on the voltage
  i = smooth(1, if (v > Maxexp * Vt) then
        Ids * (exp(Maxexp) * (1 + v / Vt - Maxexp) - 1) + v / R
      else if ((v + Bv) < -Maxexp * (Nbv * Vt)) then
        -Ids - Ibv * exp(Maxexp) * (1 - (v + Bv) / (Nbv * Vt) - Maxexp) + v / R
      else
        Ids * (exp(v / Vt) - 1) - Ibv * exp(-(v + Bv) / (Nbv * Vt)) + v / R);

  // Define the power loss in the diode
  LossPower = v * i;

  // Connect the current and voltage to the OnePort interface
  v = port.v;
  i = port.i;
  
  // Conditional heat port
  if useHeatPort then
    heatPort.Q_flow = LossPower;
  end if;
end ZDiode;