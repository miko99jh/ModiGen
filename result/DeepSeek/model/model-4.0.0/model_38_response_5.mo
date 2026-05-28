block FractionalDelay extends Modelica.Clocked.IntegerSignals.Interfaces.PartialClockedSISO
  parameter Integer shift(min=0) = 0 "Delay as a product of the sample period and the ratio shift/resolution";
  parameter Integer resolution(min=1) = 1 "Time quantization resolution of the sample period";
  protected 
    Integer n = div(shift,resolution) if resolution!= 0 else 0 "Number of delay steps";
    Integer u_buffer[n+1](each start=0) if n >= 0;
    Boolean first(start=true) = true;
  equation 
    first = false when first() or not first;
    if first then
      for i in 1:n+1 loop
        u_buffer[i] = u;
      end for;
    else
      u_buffer = shiftSample(u_buffer, 1, resolution);
    end if;
    y = shiftSample(u_buffer[1], shift, resolution);
end FractionalDelay;