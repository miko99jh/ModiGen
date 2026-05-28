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
  Real onOff "On/Off signal for the heating system";

  // Inputs
  input Real TTankTop "Temperature at the top of the tank";
  input Real TTankBot "Temperature at the bottom of the tank";
  input Real heatingCurve.TSup "Supply temperature from the heating curve";

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