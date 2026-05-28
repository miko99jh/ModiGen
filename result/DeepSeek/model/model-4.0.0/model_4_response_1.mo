model Ctrl_Heating_TES
  extends IDEAS.Controls.ControlHeating.Interfaces.Partial_Ctrl_Heating_TES;
  parameter Modelica.SIunits.Temperature dTSafetyTop(min = 0) = 1;
  parameter Modelica.SIunits.Temperature dTSafetyBot(min = 0) = 1;
  parameter Modelica.SIunits.Temperature dTHPTankSet(min = 0) = 1;

  Modelica.SIunits.Temperature TTopSet;
  Modelica.SIunits.Temperature TBotSet;
  Modelica.SIunits.Temperature THPSet;

equation
  TTopSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyTop;
  TBotSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyBot;
  THPSet = max(TDHWSet, heatingCurve.TSup) + dTHPTankSet;

  onOff = if (TTankTop < TTopSet) and (TTankBot < TBotSet - dTSafetyBot) then 
    if (HP_on > 0.5) and (TTankBot < TBotSet) then 1 else 0.5 
  else 0;
end Ctrl_Heating_TES;