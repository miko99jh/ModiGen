model Variant2_tuned
 extends ModelicaByExample.Architectures.SensorComparison.Examples.Variant2(
    redeclare ModelicaByExample.Architectures.SensorComparison.Components.Controller controller(
      yMax=50, 
      Ti=0.07, 
      Td=0.01, 
      k=4
    ),
    redeclare ModelicaByExample.Architectures.SensorComparison.Components.Actuator actuator(
      uMax=50
    ),
    redeclare ModelicaByExample.Architectures.SensorComparison.Components.Sensor sensor(
      sample_time=0.01
    )
  );
  
  // Additional tuning or components can be added here if necessary

end Variant2_tuned;