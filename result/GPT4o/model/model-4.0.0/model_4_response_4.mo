model Ctrl_Heating_TES
 extends IDEAS.Controls.ControlHeating.Interfaces.Partial_Ctrl_Heating_TES;

  // Parameters
  parameter Real dTSafetyTop = 2.0 "Safety margin for top temperature";
  parameter Real dTSafetyBot = 2.0 "Safety margin for bottom temperature";
  parameter Real dTHPTankSet = 3.0 "Margin for heat pump setpoint";

  // Variables
  Real TTopSet "Temperature setpoint for the top of the tank";
  Real TBotSet "Temperature setpoint for the bottom of the tank";
  Real THPSet "Heat pump setpoint temperature";
  Boolean onOff "On/Off signal for the heating system";

equation
  // Calculate temperature setpoints
  TTopSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyTop;
  TBotSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyBot;
  THPSet = TTopSet + dTHPTankSet;

  // Control logic for heating system activation
  onOff = if noEvent(TTankTop < TTopSet and TTankBot < TBotSet - dTSafetyBot) then 1
          else if noEvent(onOff > 0.5 and TTankBot < TBotSet) then 1
          else 0;

end Ctrl_Heating_TES;