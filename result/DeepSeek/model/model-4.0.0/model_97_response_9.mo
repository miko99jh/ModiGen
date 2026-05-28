model RTD_Pt100
  parameter Real V = 1.15*10^(-9); //volume of the sensor
  parameter Real c = 456; //comprehensive specific heat
  parameter Real Ar = 5.31*10^(-6); //sensor surface area
  parameter Real alpha = 800; //convective heat transfer coefficient
  parameter Real pho = 7980; //comprehensive density
  Real Tj(start=25); //sensor temperature
  Real Tg(start=100); //medium temperature
  Real Q_sens; //heat flow from sensor to medium
  Real Q_med; //heat flow from medium to sensor
  Real m = pho*V; //mass of the sensor
  equation
    //heat balance equation
    der(Tj) = (Q_sens - Q_med)/m;
    //heat flow from sensor to medium
    Q_sens = alpha*Ar*(Tg - Tj);
    //heat flow from medium to sensor
    Q_med = c*m*der(Tg);
end RTD_Pt100;