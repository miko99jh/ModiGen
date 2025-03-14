model ControlledIdealOpeningSwitch "Controlled ideal electrical opener"
  parameter Modelica.Units.SI.Voltage level=0.5 "Switch level";
  extends Modelica.Electrical.Analog.Interfaces.IdealSwitch;
  Modelica.Electrical.Analog.Interfaces.Pin control
 "Control pin: control.v > level switch open, otherwise p--n connected";
equation
  off = control.v > level;
  control.i = 0;
end ControlledIdealOpeningSwitch;
