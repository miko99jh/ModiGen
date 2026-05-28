model Ctrl_Heating_TES
  extends IDEAS.Controls.ControlHeating.Interfaces.Partial_Ctrl_Heating_TES;
  parameter Modelica.SIunits.Temperature dTSafetyTop = 1 "Top tank safety margin";
  parameter Modelica.SIunits.Temperature dTSafetyBot = 1 "Bottom tank safety margin";
  parameter Modelica.SIunits.Temperature dTHPTankSet = 1 "Heat pump setpoint safety margin";
  Modelica.SIunits.Temperature TTopSet(start=20);
  Modelica.SIunits.Temperature TBotSet(start=20);
  Modelica.SIunits.Temperature THPSet(start=20);
equation 
  TTopSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyTop;
  TBotSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyBot;
  THPSet = TTopSet + dTHPTankSet;
  onOff = if (TTankTop < TTopSet and TTankBot < TBotSet - dTSafetyBot) then
    if (HP_on and TTankTop > TTopSet * 0.5 and TTankBot < TBotSet) then
      1
    else
      0
    end if
  else
    0
  end if;
end Ctrl_Heating_TES;