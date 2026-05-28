model RTD_Pt100
  parameter Real V = 1.15*10^(-9); // volume of the sensor
  parameter Real c = 456; // comprehensive specific heat
  parameter Real Ar = 5.31*10^(-6); // sensor surface area
  parameter Real alpha = 800; // convective heat transfer coefficient
  parameter Real pho = 7980; // comprehensive density
  Real Tj(start = 25); // sensor temperature
  Real Tg(start = 100); // medium temperature
  Real m = pho*V; // mass of the sensor
  Real Q_convection = alpha*Ar*(Tj - Tg); // convection heat transfer
  Real Q_sens = c*m*(der(Tj) - (Tj - Tg)/V); // heat balance
equation 
  der(Tj) = Q_sens/m + (Tj - Tg)/V; // heat balance
  Tg = input(100, "°C"); // medium temperature
end RTD_Pt100;