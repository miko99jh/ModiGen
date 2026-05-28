model Variant2_tuned
 extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant2(
    redeclare Modelica.Blocks.Continuous.PID controller(
      yMax=50, 
      Ti=0.07, 
      Td=0.01, 
      k=4
    ),
    redeclare Modelica.Blocks.Nonlinear.Limiter actuator(
      uMax=50
    ),
    redeclare Modelica.Blocks.Discrete.Sampler sensor(
      samplePeriod=0.01
    )
  );
  
  annotation(
    uses(Modelica(version="3.2.3")),
    Documentation(info="This is a tuned version of Variant 2, designed to demonstrate improved sensor and control dynamics in testing different architecture scenarios.")
  );
end Variant2_tuned;