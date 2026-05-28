model Ctrl_Heating_TES
 extends IDEAS.Controls.ControlHeating.Interfaces.Partial_Ctrl_Heating_TES;

  // Parameters
  parameter Real dTSafetyTop = 2 "Safety margin for top tank temperature";
  parameter Real dTSafetyBot = 2 "Safety margin for bottom tank temperature";
  parameter Real dTHPTankSet = 1 "Margin for heat pump setpoint";

  // Outputs
  output Real TTopSet "Setpoint temperature for the top of the tank";
  output Real TBotSet "Setpoint temperature for the bottom of the tank";
  output Real THPSet "Setpoint temperature for the heat pump";
  output Real onOff "Control signal for heating system activation";

protected
  // Intermediate variables
  Real TTopSet_internal "Internal calculation for TTopSet";
  Real TBotSet_internal "Internal calculation for TBotSet";

equation
  // Calculate TTopSet as the maximum of TDHWSet and heatingCurve.TSup, plus safety margin
  TTopSet_internal = max(TDHWSet, heatingCurve.TSup) + dTSafetyTop;
  TTopSet = TTopSet_internal;

  // Calculate TBotSet as the maximum of TDHWSet and heatingCurve.TSup, plus bottom safety margin
  TBotSet_internal = max(TDHWSet, heatingCurve.TSup) + dTSafetyBot;
  TBotSet = TBotSet_internal;

  // Calculate THPSet as TTopSet plus an additional margin
  THPSet = TTopSet_internal + dTHPTankSet;

  // Control logic for onOff signal
  if noEvent(TTankTop < TTopSet_internal and TTankBot < TBotSet_internal - dTSafetyBot) then
    onOff = 1;
  elseif noEvent(onOff > 0.5 and TTankBot < TBotSet_internal) then
    onOff = 1;
  else
    onOff = 0;
  end if;

end Ctrl_Heating_TES;