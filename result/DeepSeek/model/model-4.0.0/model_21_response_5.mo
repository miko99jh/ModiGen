model TransformerWithPhaseShifterTarget
  extends TransformerWithPhaseShifterInterval(
    final IMax = targetValueI + deadBandI,
    final IMin = targetValueI - deadBandI,
    final PMax = targetValueP + deadBandP,
    final PMin = targetValueP - deadBandP
  );
  parameter Types.Current targetValueI(start = 0) = NotUsed "The target current value";
  parameter Types.Current deadBandI(start = 0) = NotUsed "The acceptable dead-band around the current target value";
  parameter Types.ActivePower targetValueP(start = 0) = NotUsed "The target active power value";
  parameter Types.ActivePower deadBandP(start = 0) = NotUsed "The acceptable dead-band around the active power target value";
initial equation
  assert(targetValueI > deadBandI, "Invalid targetValueI");
  assert(deadBandI > 0, "Invalid deadBandI");
  assert(targetValueI >= 0, "Invalid targetValueI");
  if quantitySel == MonitoredQuantitySelection.currentMagnitude then
    assert(targetValueI > deadBandI, "Invalid targetValueI");
    assert(deadBandI > 0, "Invalid deadBandI");
    assert(targetValueI >= 0, "Invalid targetValueI");
  elseif quantitySel == MonitoredQuantitySelection.activePower then
    assert(targetValueP > deadBandP, "Invalid targetValueP");
    assert(deadBandP > 0, "Invalid deadBandP");
    assert(targetValueP >= 0, "Invalid targetValueP");
  end if;
end TransformerWithPhaseShifterTarget;