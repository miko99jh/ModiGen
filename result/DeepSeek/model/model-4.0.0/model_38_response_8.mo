block FractionalDelay extends Modelica.Clocked.IntegerSignals.Interfaces.PartialClockedSISO
  parameter Integer shift(min=0) = 0 "Delay as a product of the sample period and the ratio shift/resolution";
  parameter Integer resolution(min=1) = 1 "Time quantization resolution of the sample period";
  protected 
    Integer n = div(shift,resolution) "Number of delay steps";
    Integer u_buffer[n+1](each start=0) "Previous values of the inputs";
    Boolean first(start=true) "Flag indicating the first clock tick";
  equation 
    // Flag Update
    first = false;
    // Buffer Management
    if first then
      u_buffer = fill(u, n+1);
    else
      u_buffer = {u, shiftSample(u_buffer, -1)};
    end if;
    // Output Calculation
    y = shiftSample(u_buffer[1], shift, resolution);
end FractionalDelay;