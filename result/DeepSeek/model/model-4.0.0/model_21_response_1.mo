model TransformerWithPhaseShifterTarget
  extends TransformerWithPhaseShifterInterval(
    final IMax = targetValueI + deadBandI,
    final IMin = targetValueI - deadBandI,
    final PMax = targetValueP + deadBandP,
    final PMin = targetValueP - deadBandP
  );
  parameter Types.Current targetValueI(start = NotUsed) "The target current value";
  parameter Types.Current deadBandI(start = NotUsed) "The acceptable dead-band around the current target value";
  parameter Types.ActivePower targetValueP(start = NotUsed) "The target active power value";
  parameter Types.ActivePower deadBandP(start = NotUsed) "The acceptable dead-band around the active power target value";
initial equation
  when quantitySel == MonitoredQuantitySelection.currentMagnitude then
    assert(targetValueI > deadBandI, "targetValueI must be greater than deadBandI");
    assert(deadBandI > 0, "deadBandI must be greater than 0");
    assert(targetValueI >= 0, "targetValueI must be non-negative");
  end when;
  when quantitySel == MonitoredQuantitySelection.activePower then
    assert(targetValueP > deadBandP, "targetValueP must be greater than deadBandP");
    assert(deadBandP > 0, "deadBandP must be greater than 0");
    assert(targetValueP >= 0, "targetValueP must be non-negative");
  end when;
end TransformerWithPhaseShifterTarget;