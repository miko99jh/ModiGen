model ZDiode "Zener diode with 3 working areas"
  extends Modelica.Electrical.Analog.Interfaces.OnePort;
  parameter Modelica.Units.SI.Current Ids=1e-6 "Saturation current";
  parameter Modelica.Units.SI.Voltage Vt=0.04 "Voltage equivalent of temperature (kT/qn)";
  parameter Real Maxexp(final min=Modelica.Constants.small) = 30
 "Max. exponent for linear continuation";
  parameter Modelica.Units.SI.Resistance R=1e8 "Parallel ohmic resistance";
  parameter Modelica.Units.SI.Voltage Bv=5.1 "Breakthrough voltage = Zener- or Z-voltage";
  parameter Modelica.Units.SI.Current Ibv=0.7 "Breakthrough knee current";
  parameter Real Nbv=0.74 "Breakthrough emission coefficient";
  extends Modelica.Electrical.Analog.Interfaces.ConditionalHeatPort(T=293.15);
equation
  i = smooth(1, if (v>Maxexp*Vt) then
 Ids*( exp(Maxexp)*(1 + v/Vt - Maxexp)-1) + v/R else
 if ( (v+Bv)<-Maxexp*(Nbv*Vt)) then
 -Ids -Ibv* exp(Maxexp)*(1 - (v+Bv)/(Nbv*Vt) - Maxexp) +v/R else
 Ids*(exp(v/Vt)-1) - Ibv*exp(-(v+Bv)/(Nbv*Vt)) + v/R);
  LossPower = v*i
 ;
end ZDiode;
