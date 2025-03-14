block FractionalDelay1
  "Delay the clocked input signal for a fractional multiple of the sample period"
extends Modelica.Clocked.IntegerSignals.Interfaces.PartialClockedSISO;

  parameter Integer shift(min=0) = 0
    "Delay = interval() * shift/resolution";
  parameter Integer resolution(min=1) = 1
    "Time quantization resolution of sample interval";
protected
  parameter Integer n = div(shift,resolution);
  Integer u_buffer[n+1](each start=0)
    "The previous values of the inputs; u_last[1] = u, u_last[2] = previous(u_last[1]); u_last[3] = previous(u_last[2])";
  Boolean first(start=true) "Used to identify the first clock tick";
equation
 first = false;
 u_buffer = if previous(first) then fill(u,n+1) else cat(1, {u}, previous(u_buffer[1:n]));
 y = shiftSample(u_buffer[n+1], shift, resolution);
end FractionalDelay1;
