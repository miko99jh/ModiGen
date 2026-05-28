block FractionalDelay extends Modelica.Clocked.IntegerSignals.Interfaces.PartialClockedSISO(redeclare parameter Integer shift=0 "Specifies the delay as a product of the sample period (interval()) and the ratio shift/resolution"; redeclare parameter Integer resolution=1 "Represents the time quantization resolution of the sample period")
  protected Integer n = div(shift,resolution);
  protected Integer u_buffer[n+1](each start=0);
  protected Boolean first(start=true);
equation 
  first = false;
  for i in 1:n+1 loop
    if first then
      u_buffer[i] = u;
    else
      u_buffer[i] = (i <= n)? u_buffer[i+1] : u;
    end if;
  end for;
  y = shiftSample(u_buffer[1], shift, resolution);
end FractionalDelay;