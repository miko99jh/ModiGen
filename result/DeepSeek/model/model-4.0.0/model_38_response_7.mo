block FractionalDelay extends Modelica.Clocked.IntegerSignals.Interfaces.PartialClockedSISO
  parameter Integer shift(min=0) = 0 "Delay as a product of the sample period and the ratio shift/resolution";
  parameter Integer resolution(min=1) = 1 "Time quantization resolution of the sample period";
  protected 
  Integer n = div(shift,resolution) if shift>=0 else div(shift-1,resolution)+1;
  Integer u_buffer[n+1](each start=0) if shift>=0 else Integer u_buffer[div(shift+1,resolution)+1](each start=0);
  Boolean first(start=true);
  equation 
  first = false;
  if first then 
    u_buffer = rep(u, n+1);
  else 
    u_buffer = {u, shiftSample(u_buffer, -1)};
  end if;
  y = shiftSample(u_buffer[1], shift, resolution);
end FractionalDelay;