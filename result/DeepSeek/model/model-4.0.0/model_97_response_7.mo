model RTD_Pt100
  parameter Real V = 1.15*10^(-9); //Volume of the sensor
  parameter Real c = 456; //Comprehensive specific heat
  parameter Real Ar = 5.31*10^(-6); //Sensor surface area
  parameter Real alpha = 800; //Convective heat transfer coefficient
  parameter Real pho = 7980; //Comprehensive density
  parameter Real Tj_initial = 25; //Initial temperature of the sensor
  input Real Tg; //Temperature of the measured medium
  output Real Tj; //Temperature of the sensor
  initial equation
    Tj = Tj_initial;
equation
  // Heat balance equation
  der(Tj) = (alpha*Ar*(Tg - Tj) + V*c*pho*der(Tj))/V/c/pho;
end RTD_Pt100;