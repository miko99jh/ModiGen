block FractionalDelay
 extends Modelica.Clocked.IntegerSignals.Interfaces.PartialClockedSISO;

  parameter Integer shift(min=0) = 0 "Delay as a product of the sample period and the ratio shift/resolution";
  parameter Integer resolution(min=1) = 1 "Time quantization resolution of the sample period";

protected 
  Integer n = div(shift, resolution);
  Integer u_buffer[n+1](each start=0) "Buffer to store previous values of the input";
  Boolean first(start=true) "Flag to identify the first clock tick";

equation
  // Update the flag to indicate the first tick has passed
  first = false;

  // Buffer management
  if previous(first) then
    // On the first tick, initialize the buffer with the current input
    for i in 1:n+1 loop
      u_buffer[i] = u;
    end for;
  else
    // On subsequent ticks, shift the buffer and update with the current input
    u_buffer[1] = u;
    for i in 2:n+1 loop
      u_buffer[i] = previous(u_buffer[i-1]);
    end for;
  end if;

  // Output calculation using the shiftSample operator
  y = shiftSample(u_buffer[n+1], shift, resolution);
end FractionalDelay;