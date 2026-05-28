model ControlledIdealOpeningSwitch
 extends Modelica.Electrical.Analog.Interfaces.IdealSwitch;

  parameter Modelica.Units.SI.Voltage level = 0.5 "Voltage threshold for the switch to open";
  Modelica.Electrical.Analog.Interfaces.Pin control "Control pin";

equation
  // Define the behavior of the switch based on the control voltage
  off = control.v > level;

  // Ensure no current flows through the control pin
  control.i = 0;
  
  // Connect the control pin to the switch
  connect(control, p);
  connect(control, n);
end ControlledIdealOpeningSwitch;