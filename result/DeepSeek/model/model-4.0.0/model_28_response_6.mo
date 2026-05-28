block ConjunctiveClock extends Modelica.Clocked.ClockSignals.Clocks.Logical.PartialLogicalClock(combinator=Modelica.Blocks.Logical.And(nin=nin));```

//modelica
```algorithm 
  when clock then 
    if all(inputClock) then 
      outputClock = true; 
    else 
      outputClock = false; 
    end if; 
  else 
    outputClock = false; 
  end when; 
end ConjunctiveClock;