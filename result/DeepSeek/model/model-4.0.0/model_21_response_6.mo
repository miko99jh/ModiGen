model TransformerWithPhaseShifterTarget
  extends TransformerWithPhaseShifterInterval(
    final IMax = targetValueI + deadBandI,
    final IMin = targetValueI - deadBandI,
    final PMax = targetValueP + deadBandP,
    final PMin = targetValueP - deadBandP
  );
  parameter Types.Current targetValueI = Types.NotUsed "The target current value";
  parameter Types.Current deadBandI = Types.NotUsed "The acceptable dead-band around the current target value";
  parameter Types.ActivePower targetValueP = Types.NotUsed "The target active power value";
  parameter Types.ActivePower deadBandP = Types.NotUsed "The acceptable dead-band around the active power target value";
initial equation
  when quantitySel == MonitoredQuantitySelection.currentMagnitude then
    assert(targetValueI > deadBandI, "Target current value must be greater than dead-band");
    assert(deadBandI > 0, "Dead-band must be greater than zero");
    assert(targetValueI >= 0, "Target current value must be non-negative");
  end when;
  when quantitySel == MonitoredQuantitySelection.activePower then
    assert(targetValueP > deadBandP, "Target active power value must be greater than dead-band");
    assert(deadBandP > 0, "Dead-band must be greater than zero");
    assert(targetValueP >= 0, "Target active power value must be non-negative");
  end when;
end TransformerWithPhaseShifterTarget;