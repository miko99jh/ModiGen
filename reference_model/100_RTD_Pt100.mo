model RTD_Pt1001 "A Thermal resistance temperature measurement model"

  //type
  type Time = Real (unit="s");
  type Voltage = Real(unit = "V");
  type Volume = Real(unit = "m3");
  type Density = Real(unit = "kg/m3", min = 0.0);
  type Current = Real(unit = "A");
  type Resistance = Real(unit = "Ohm");
  type Area = Real(unit = "m2");
  type ThermodynamicTemperature = Real(unit = "℃");
  type CoefficientOfHeatTransfer = Real(unit = "W/(m2.K)");
  type SpecificHeatCapacity = Real(unit = "J/(kg.K)");

  //parameters
  input ThermodynamicTemperature Tg(start=100) "Temperature of the medium to be measured";
  parameter Volume V=1.15*10^(-9) "Sensor volume";
  parameter SpecificHeatCapacity c=456 "The combined specific heat capacity of the sensor";
  parameter Area Ar=5.31*10^(-6) "Surface area of sensor";
  parameter CoefficientOfHeatTransfer alpha=800 "Surface heat exchange coefficient between sensor and medium";
  parameter Density pho=7980 "Sensor synthesis and density";
  output ThermodynamicTemperature Tj(start=25) "Sensor temperature";

equation
  pho * V * c * der(Tj) = alpha * Ar * (Tg - Tj) "Thermal conductivity equation";

annotation(
    uses(Modelica(version = "4.0.0")));
end RTD_Pt1001;
