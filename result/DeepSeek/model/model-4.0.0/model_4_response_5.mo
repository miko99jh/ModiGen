model Ctrl_Heating_TES
  extends IDEAS.Controls.ControlHeating.Interfaces.Partial_Ctrl_Heating_TES;
  parameter Modelica.SIunits.Temperature dTSafetyTop = 2 "Safety margin for top tank temperature";
  parameter Modelica.SIunits.Temperature dTSafetyBot = 2 "Safety margin for bottom tank temperature";
  parameter Modelica.SIunits.Temperature dTHPTankSet = 2 "Safety margin for heat pump setpoint";
  Modelica.SIunits.Temperature TTopSet;
  Modelica.SIunits.Temperature TBotSet;
  Modelica.SIunits.Temperature THPSet;
equation
  // Calculate setpoints
  TTopSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyTop;
  TBotSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyBot;
  THPSet = TTopSet + dTHPTankSet;

  // Control logic
  onOff = if (TTankTop < TTopSet and TTankBot < TBotSet - dTSafetyBot) then
    if (HP.onOff > 0.5 and TTankTop > TTopSet) then
      1
    else
      0
    end if
  else
    noEvent(0)
  end if;
end Ctrl_Heating_TES;