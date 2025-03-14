model Test_PulseGenerator
  ModelicaByExample.DiscreteBehavior.PulseGenerator.PulseGenerator pulseGenerator(width=10e-3);
  Boolean pulse;
equation
  pulse = pulseGenerator.pulse;
end Test_PulseGenerator;
