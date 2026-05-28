model PController
 // Parameters
  parameter Real target_height = 1.0; // Target water level in meters
  parameter Real Kp = 1.0; // Proportional gain

  // Variables
  Real waterLevel(start=0.2); // Initial water level in meters
  Real error; // Altitude error
  Real control; // Control signal

equation
  // Calculate the error
  error = target_height - waterLevel;

  // Calculate the control signal using proportional control
  control = Kp * error;

  // Update the water level based on the control signal
  der(waterLevel) = control;

  annotation(
    experiment(StartTime=0, StopTime=10, Tolerance=1e-6, Interval=0.1),
    uses(Modelica(version="3.2"))
  );
end PController;