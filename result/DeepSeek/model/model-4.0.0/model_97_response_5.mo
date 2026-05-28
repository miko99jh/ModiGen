model RTD_Pt100
  parameter Real V = 1.15*10^(-9); // volume of the sensor
  parameter Real c = 456; // comprehensive specific heat
  parameter Real Ar = 5.31*10^(-6); // sensor surface area
  parameter Real alpha = 800; // convective heat transfer coefficient
  parameter Real pho = 7980; // comprehensive density
  Real Tg(start=100); // medium temperature
  Real Tj(start=25); // sensor temperature
  Real Q_conv; // convective heat transfer
  Real Q_rad; // radiative heat transfer
  Real Q_sens; // sensible heat
  Real m; // mass of the sensor
  Real A; // cross-sectional area of the sensor
  Real rho; // density of the sensor material
  Real cp; // specific heat of the sensor material
  Real k; // thermal conductivity of the sensor material
  Real h; // heat transfer coefficient
  Real dT; // temperature difference
  Real dT_sensor; // temperature difference between the sensor and the medium
  Real dT_conv; // temperature difference due to convection
  Real dT_rad; // temperature difference due to radiation
  Real dT_sens; // temperature difference due to sensible heat
  Real dT_total; // total temperature difference
  Real dT_dt; // derivative of the temperature difference
  Real dTj_dt; // derivative of the sensor temperature
  equation
    m = V*pho; // mass of the sensor
    A = sqrt(4*Ar/pi); // cross-sectional area of the sensor
    rho = m/V; // density of the sensor material
    cp = c/rho; // specific heat of the sensor material
    k = cp*rho/alpha; // thermal conductivity of the sensor material
    h = alpha/A; // heat transfer coefficient
    dT = Tg - Tj; // temperature difference
    dT_sensor = dT; // temperature difference between the sensor and the medium
    dT_conv = h*dT_sensor; // temperature difference due to convection
    dT_rad = 0; // temperature difference due to radiation
    dT_sens = c*dT_sensor/m; // temperature difference due to sensible heat
    dT_total = dT_conv + dT_rad + dT_sens; // total temperature difference
    dT_dt = der(dT); // derivative of the temperature difference
    dTj_dt = der(Tj); // derivative of the sensor temperature
    Q_conv = h*A*dT_conv; // convective heat transfer
    Q_rad = 0; // radiative heat transfer
    Q_sens = c*m*dT_sens; // sensible heat
    // heat balance equation
    der(Tj) = (Q_conv + Q_rad + Q_sens)/m/cp;
end RTD_Pt100;