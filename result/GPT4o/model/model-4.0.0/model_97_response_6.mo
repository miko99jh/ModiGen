model RTD_Pt100
 // Parameters
  parameter Real V = 1.15e-9; // Volume of the sensor [m^3]
  parameter Real c = 456; // Comprehensive specific heat [J/(kg·K)]
  parameter Real Ar = 5.31e-6; // Sensor surface area [m^2]
  parameter Real alpha = 800; // Convective heat transfer coefficient [W/(m^2·K)]
  parameter Real pho = 7980; // Comprehensive density [kg/m^3]

  // Inputs
  input Real Tg; // Medium temperature [°C]

  // Outputs
  output Real Tj(start=25); // Sensor temperature [°C]

  // Variables
  Real Q_dot; // Heat transfer rate [W]

equation
  // Heat transfer rate from the medium to the sensor
  Q_dot = alpha * Ar * (Tg - Tj);

  // Differential equation for the temperature change of the sensor
  der(Tj) = Q_dot / (pho * V * c);
end RTD_Pt100;