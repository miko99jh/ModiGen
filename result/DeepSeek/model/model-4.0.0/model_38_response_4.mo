block FractionalDelay extends Modelica.Clocked.IntegerSignals.Interfaces.PartialClockedSISO
  parameter Integer shift(min=0) = 0 "Delay as a product of the sample period and the ratio shift/resolution";
  parameter Integer resolution(min=1) = 1 "Time quantization resolution of the sample period";
protected 
  Integer n = div(shift,resolution) "Number of delay samples";
  Integer u_buffer[n+1](each start=0) "Previous values of the inputs";
  Boolean first(start=true) "Used to identify the first clock tick";
equation 
  first = false;
  if first then 
    u_buffer = rep(u, n+1);
  else 
    u_buffer = {u, previous(u_buffer)[1:n]};
  end if;
  y = shiftSample(u_buffer[1], shift, resolution);
end FractionalDelay;