block Ramp
 extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSO;

  parameter Real height = 1 "The height of the ramp signal (unitless)";
  parameter Integer durationTicks(min=1) = 1 "The duration of the ramp in terms of the number of clock ticks";
  parameter Real offset = 0 "The offset value of the output signal before the ramp starts (unitless)";
  parameter Integer startTick(min=1) = 1 "The clock tick at which the output starts ramping";

  protected
    Integer counter(start=0) "A counter that tracks the number of clock ticks";

  output Real y "The output signal that starts at the offset value and ramps up to the specified height";

equation
  when Clock.tick() then
    if counter < startTick + durationTicks then
      counter = counter + 1;
    end if;
  end when;

  if counter < startTick then
    y = offset;
  elseif counter <= startTick + durationTicks then
    y = offset + (counter - startTick) * height / durationTicks;
  else
    y = offset + height;
  end if;
end Ramp;