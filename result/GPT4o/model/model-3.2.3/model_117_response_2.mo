model Variant1_unstable
 extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant1(
    redeclare Modelica.Blocks.Discrete.Sampler sensor(
      samplePeriod=0.036
    )
  );
end Variant1_unstable;