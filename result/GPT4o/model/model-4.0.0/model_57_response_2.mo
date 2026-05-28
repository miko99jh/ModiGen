model ControlledIdealOpeningSwitch
 extends Modelica.Electrical.Analog.Interfaces.IdealSwitch;

  parameter Modelica.Units.SI.Voltage level = 0.5 "Voltage threshold for the switch to open";
  Modelica.Electrical.Analog.Interfaces.Pin control "Control pin";

equation
  // The switch is open when the control voltage exceeds the threshold level
  off = control.v > level;

  // Ensure no current flows through the control pin
  control.i = 0;
end ControlledIdealOpeningSwitch;