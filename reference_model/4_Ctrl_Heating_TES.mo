model Ctrl_Heating_TES1
  "Heating curve control for heating based on a water storage tank"
  extends IDEAS.Controls.ControlHeating.Interfaces.Partial_Ctrl_Heating_TES;

equation
  TTopSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyTop;
  TBotSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyBot;
  THPSet = TTopSet + dTHPTankSet;

  if noEvent(TTankTop < TTopSet and TTankBot < (TBotSet - dTSafetyBot)) then
    // top too cold, system MUST be on except if bottom is still very hot (temp inversion?)
    onOff = 1;
  elseif noEvent(TTankBot < TBotSet and onOff > 0.5) then
    // HP running, top is fine, bottom too cold: keep running
    onOff = 1;
  else
    // all other cases: shut down
    onOff = 0;
  end if;
end Ctrl_Heating_TES1;
