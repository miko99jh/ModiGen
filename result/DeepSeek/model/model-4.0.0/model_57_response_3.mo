model ControlledIdealOpeningSwitch
  extends Modelica.Electrical.Analog.Interfaces.IdealSwitch;
  parameter Modelica.Units.SI.Voltage level=0.5 "Voltage threshold for switch to open";
  Modelica.Electrical.Analog.Interfaces.Pin control;
equation 
  off = control.v > level;
  control.i = 0;
end ControlledIdealOpeningSwitch;