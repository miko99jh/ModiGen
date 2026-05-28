model TransformerWithPhaseShifterTarget
  extends TransformerWithPhaseShifterInterval(
    final IMax = targetValueI + deadBandI,
    final IMin = targetValueI - deadBandI,
    final PMax = targetValueP + deadBandP,
    final PMin = targetValueP - deadBandP
  );

  parameter Types.Current targetValueI(start = 0) "Target current value";
  parameter Types.Current deadBandI(start = 0) "Dead-band around the current target value";
  parameter Types.ActivePower targetValueP(start = 0) "Target active power value";
  parameter Types.ActivePower deadBandP(start = 0) "Dead-band around the active power target value";

  initial equation
    if quantitySel == MonitoredQuantitySelection.currentMagnitude then
      assert(targetValueI > deadBandI, "Target current value must be greater than dead-band");
      assert(deadBandI > 0, "Dead-band must be greater than zero");
      assert(targetValueI >= 0, "Target current value must be non-negative");
    else if quantitySel == MonitoredQuantitySelection.activePower then
      assert(targetValueP > deadBandP, "Target active power value must be greater than dead-band");
      assert(deadBandP > 0, "Dead-band must be greater than zero");
      assert(targetValueP >= 0, "Target active power value must be non-negative");
    end if;
  end TransformerWithPhaseShifterTarget;