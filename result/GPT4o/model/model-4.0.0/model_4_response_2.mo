model Ctrl_Heating_TES
 extends IDEAS.Controls.ControlHeating.Interfaces.Partial_Ctrl_Heating_TES;

  // Parameters
  parameter Real TDHWSet "Domestic hot water setpoint temperature";
  parameter Real dTSafetyTop "Safety margin for the top of the tank";
  parameter Real dTSafetyBot "Safety margin for the bottom of the tank";
  parameter Real dTHPTankSet "Margin for the heat pump setpoint";

  // Variables
  Real TTopSet "Temperature setpoint for the top of the tank";
  Real TBotSet "Temperature setpoint for the bottom of the tank";
  Real THPSet "Heat pump setpoint temperature";
  Real TSup "Supply temperature from the heating curve";
  Real TTankTop "Current temperature at the top of the tank";
  Real TTankBot "Current temperature at the bottom of the tank";
  Boolean onOff "On/Off signal for the heating system";

equation
  // Calculate temperature setpoints
  TTopSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyTop;
  TBotSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyBot;
  THPSet = TTopSet + dTHPTankSet;

  // Control logic for the heating system
  onOff = if noEvent(TTankTop < TTopSet and TTankBot < TBotSet - dTSafetyBot) then 1
          else if noEvent(onOff > 0.5 and TTankBot < TBotSet) then 1
          else 0;

end Ctrl_Heating_TES;