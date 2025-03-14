model Test_WithNoEvents
  ModelicaByExample.DiscreteBehavior.Accuracy.WithNoEvents withNoEvents(freq=1.5, x(start=0.1));
  Real y;
equation
  y=withNoEvents.y;
end Test_WithNoEvents;
