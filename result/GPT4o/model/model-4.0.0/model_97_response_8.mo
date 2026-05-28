model RTD_Pt100
 // Parameters
  parameter Real V = 1.15e-9; // Volume of the sensor [m^3]
  parameter Real c = 456; // Comprehensive specific heat [J/(kg·K)]
  parameter Real Ar = 5.31e-6; // Sensor surface area [m^2]
  parameter Real alpha = 800; // Convective heat transfer coefficient [W/(m^2·K)]
  parameter Real pho = 7980; // Comprehensive density [kg/m^3]

  // Inputs
  input Real Tg; // Temperature of the measured medium [°C]

  // Outputs
  output Real Tj(start=25); // Sensor temperature [°C]

  // Variables
  Real Q; // Heat transfer rate [W]

equation
  // Heat transfer equation
  Q = alpha * Ar * (Tg - Tj);

  // Temperature change equation
  der(Tj) = Q / (pho * V * c);
end RTD_Pt100;