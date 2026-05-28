model Ctrl_Heating_TES
  extends IDEAS.Controls.ControlHeating.Interfaces.Partial_Ctrl_Heating_TES;
  parameter Modelica.SIunits.Temperature dTSafetyTop(min = 0) = 0.5 "Safety margin for top tank temperature";
  parameter Modelica.SIunits.Temperature dTSafetyBot(min = 0) = 0.5 "Safety margin for bottom tank temperature";
  parameter Modelica.SIunits.Temperature dTHPTankSet(min = 0) = 0.5 "Margin for heat pump setpoint";

  Modelica.SIunits.Temperature TTopSet "Top tank setpoint";
  Modelica.SIunits.Temperature TBotSet "Bottom tank setpoint";
  Modelica.SIunits.Temperature THPSet "Heat pump setpoint";

equation 
  // Calculate setpoints
  TTopSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyTop;
  TBotSet = max(TDHWSet, heatingCurve.TSup) + dTSafetyBot;
  THPSet = TTopSet + dTHPTankSet;

  // Control logic
  onOff = if (TTankTop < TTopSet and TTankBot < TBotSet - dTSafetyBot) then
    if (HP_running and TTankTop > TTopSet and TTankBot < TBotSet) then
      1
    else
      0
    end if
  else
    0
  end if;

  // Connect signals
  connect(onOff, heatingCurve.onOff);
  connect(THPSet, heatingCurve.TSet);
end Ctrl_Heating_TES;