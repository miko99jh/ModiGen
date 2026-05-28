block Ramp extends Modelica.Clocked.RealSignals.Interfaces.PartialClockedSO
  parameter Real height = 1 "The height of the ramp signal";
  parameter Integer durationTicks(min=1) = 1 "The duration of the ramp in terms of the number of clock ticks";
  parameter Real offset = 0 "The offset value of the output signal before the ramp starts";
  parameter Integer startTick(min=1) = 1 "The clock tick at which the output starts ramping";
  protected 
  Integer counter(start=0) "A counter that tracks the number of clock ticks";
  output Real y "The output signal that starts at the offset value and ramps up to the specified height";
equation 
  when clock then
    counter = if counter < startTick + durationTicks then counter + 1 else counter;
    y = if counter < startTick then offset else
        if counter < startTick + durationTicks then offset + (counter - startTick)*height/durationTicks else offset + height;
  end when;
end Ramp;