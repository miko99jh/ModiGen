block ConjunctiveClock extends Modelica.Clocked.ClockSignals.Clocks.Logical.PartialLogicalClock(combinator=Modelica.Blocks.Logical.And(nin=nin));```

//modelica
```algorithm 
// Re-declare the internal 'combinator' component with the appropriate Boolean logic block from the Modelica Standard Library
combinator = Modelica.Blocks.Logical.And(nin=nin);
```

//modelica
```end ConjunctiveClock;