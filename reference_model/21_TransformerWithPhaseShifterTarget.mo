model TransformerWithPhaseShifterTarget
  extends PowerGrids.Electrical.Branches.TransformerWithPhaseShifterInterval(
    final IMax = targetValueI + deadBandI, 
    final IMin = targetValueI - deadBandI,
    final PMax = targetValueP + deadBandP,
    final PMin = targetValueP - deadBandP);
  
  parameter Types.Current targetValueI = NotUsed "Current target value" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.currentMagnitude));
  parameter Types.Current deadBandI = NotUsed "Acceptable dead-band next to the Current target value" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.currentMagnitude));
  parameter Types.ActivePower targetValueP = NotUsed "Current target value" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.activePower));
  parameter Types.ActivePower deadBandP = NotUsed "Maximum Active Power threshold for phase shifter logic" annotation(
  Dialog(enable = quantitySel == MonitoredQuantitySelection.activePower));

initial equation
  if quantitySel == MonitoredQuantitySelection.currentMagnitude then
    assert(targetValueI > deadBandI, "Dead band cannot exceed the target value");
    assert(deadBandI > 0, "Dead band must be positive");
    assert(targetValueI >= 0, "Target value must be positive");
  elseif quantitySel == MonitoredQuantitySelection.activePower then
    assert(targetValueP > deadBandP, "Dead band cannot exceed the target value");
    assert(deadBandP > 0, "Dead band must be positive");
    assert(targetValueP >= 0, "Target value must be positive");
  end if;
end TransformerWithPhaseShifterTarget;
