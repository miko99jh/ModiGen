model Ctrl_Heating_TES
  extends IDEAS.Controls.ControlHeating.Interfaces.Partial_Ctrl_Heating_TES;
  parameter Modelica.SIunits.Temperature dTSafetyTop = 1 "Safety margin for top tank temperature";
  parameter Modelica.SIunits.Temperature dTSafetyBot = 1 "Safety margin for bottom tank temperature";
  parameter Modelica.SIunits.Temperature dTHPTankSet = 1 "Safety margin for heat pump setpoint";
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
    if (HP_on and TTankTop > TTopSet * 0.5 and TTankBot < TBotSet) then
      1
    else
      0
    end if
  else
    noEvent(0)
  end if;
end Ctrl_Heating_TES;