block FractionalDelay extends Modelica.Clocked.IntegerSignals.Interfaces.PartialClockedSISO(redeclare parameter Integer shift=0, resolution=1)
  protected 
    Integer n = div(shift,resolution);
    Integer u_buffer[n+1](each start=0);
    Boolean first(start=true);
  equation 
    // Flag Update
    first = false;
    // Buffer Management
    if first then 
      u_buffer = fill(u, n+1);
    else 
      u_buffer = {u, previous(u_buffer)};
    end if;
    // Output Calculation
    y = shiftSample(u_buffer, shift, resolution);
end FractionalDelay;