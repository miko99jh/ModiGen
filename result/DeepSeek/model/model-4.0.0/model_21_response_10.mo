model TransformerWithPhaseShifterTarget
  extends TransformerWithPhaseShifterInterval(
    IMax = targetValueI + deadBandI,
    IMin = targetValueI - deadBandI,
    PMax = targetValueP + deadBandP,
    PMin = targetValueP - deadBandP
  );
  parameter Types.Current targetValueI(start = NotUsed) "The target current value";
  parameter Types.Current deadBandI(start = NotUsed) "The acceptable dead-band around the current target value";
  parameter Types.ActivePower targetValueP(start = NotUsed) "The target active power value";
  parameter Types.ActivePower deadBandP(start = NotUsed) "The acceptable dead-band around the active power target value";
initial equation
  when start() then
    assert(targetValueI > deadBandI, "Target value I must be greater than deadBandI");
    assert(deadBandI > 0, "DeadBandI must be greater than 0");
    assert(targetValueI >= 0, "Target value I must be non-negative");
    assert(targetValueP > deadBandP, "Target value P must be greater than deadBandP");
    assert(deadBandP > 0, "DeadBandP must be greater than 0");
    assert(targetValueP >= 0, "Target value P must be non-negative");
  end when;
equation 
  switch quantitySel
    case MonitoredQuantitySelection.currentMagnitude:
      assert(targetValueI > deadBandI, "Target value I must be greater than deadBandI");
      assert(deadBandI > 0, "DeadBandI must be greater than 0");
      assert(targetValueI >= 0, "Target value I must be non-negative");
    case MonitoredQuantitySelection.activePower:
      assert(targetValueP > deadBandP, "Target value P must be greater than deadBandP");
      assert(deadBandP > 0, "DeadBandP must be greater than 0");
      assert(targetValueP >= 0, "Target value P must be non-negative");
  end switch;
end TransformerWithPhaseShifterTarget;