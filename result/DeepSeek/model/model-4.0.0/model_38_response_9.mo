block FractionalDelay extends Modelica.Clocked.IntegerSignals.Interfaces.PartialClockedSISO
  parameter Integer shift(min=0) = 0 "Delay as a product of the sample period and the ratio shift/resolution";
  parameter Integer resolution(min=1) = 1 "Time quantization resolution of the sample period";
  protected 
  Integer n = div(shift,resolution) if shift > 0 else 0;
  Integer u_buffer[n+1](each start=0) if n > 0;
  Boolean first(start=true);
  equation 
  first = false;
  if first then 
    u_buffer = fill(u, n+1);
  else 
    u_buffer = {u} ++ u_buffer[1:n];
  end if;
  y = shiftSample(u_buffer[1], shift, resolution);
end FractionalDelay;