model ControlledIdealOpeningSwitch
 extends Modelica.Electrical.Analog.Interfaces.IdealSwitch;

  // Parameter to define the voltage threshold for the switch to open
  parameter Modelica.Units.SI.Voltage level = 0.5 "Voltage threshold for opening the switch";

  // Control pin to determine the state of the switch
  Modelica.Electrical.Analog.Interfaces.Pin control "Control pin to open/close the switch";

equation
  // Switch is open (off=true) when control voltage exceeds the threshold level
  off = control.v > level;

  // Ensure no current flows through the control pin
  control.i = 0;
end ControlledIdealOpeningSwitch;