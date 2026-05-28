model Variant2_tuned
 extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant2(
    redeclare Modelica.Blocks.Continuous.PID controller(
      yMax=50, 
      Ti=0.07, 
      Td=0.01, 
      k=4
    ),
    redeclare Modelica.Blocks.Interfaces.RealOutput actuator(
      uMax=50
    ),
    redeclare Modelica.Blocks.Interfaces.RealInput sensor(
      sample_time=0.01
    )
  );

  // Additional parameters or components can be added here if needed

  annotation (
    uses(Modelica(version="3.2.3"))
  );
end Variant2_tuned;