model Test_Counter
  ModelicaByExample.DiscreteBehavior.Counter.Counter counter(interval=10e-3);
  Integer count;
equation
  count=counter.count;
end Test_Counter;
