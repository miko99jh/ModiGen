model RTD_Pt100
  parameter Real V = 1.15*10^(-9); // volume of the sensor
  parameter Real c = 456; // comprehensive specific heat
  parameter Real Ar = 5.31*10^(-6); // sensor surface area
  parameter Real alpha = 800; // convective heat transfer coefficient
  parameter Real pho = 7980; // comprehensive density
  Real Tj(start = 25); // sensor temperature
  input Real Tg; // medium temperature
  Real Q_conv; // convective heat transfer
  Real Q_rad; // radiative heat transfer
  Real Q_sens; // sensible heat
  Real m; // mass of the sensor
  Real A; // sensor surface area
  Real R; // resistance of the sensor
  Real V_j; // voltage across the sensor
  Real Tj_prev; // previous sensor temperature
  equation
    // mass of the sensor
    m = V*pho;
    // sensor surface area
    A = 2*Ar;
    // resistance of the sensor
    R = 100; // this is a dummy value, replace it with the actual resistance calculation
    // voltage across the sensor
    V_j = R*m*(Tj - Tg)/(Tj - Tj_prev);
    // heat balance equation
    Q_conv = alpha*A*(Tj - Tg);
    Q_rad = 0; // this is a dummy value, replace it with the actual radiative heat transfer calculation
    Q_sens = m*c*(Tj - Tj_prev)/V;
    // differential equation for sensor temperature
    der(Tj) = (Q_conv + Q_rad + Q_sens)/m/c;
    // update previous sensor temperature
    Tj_prev = Tj;
end RTD_Pt100;