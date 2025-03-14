model NewtonCoolingDynamic1
  "Cooling example with fluctuating ambient conditions"
  // Types
  type Temperature=Real(unit="K", min=0);
  type ConvectionCoefficient=Real(unit="W/(m2.K)", min=0);
  type Area=Real(unit="m2", min=0);
  type Mass=Real(unit="kg", min=0);
  type SpecificHeat=Real(unit="J/(K.kg)", min=0);

  // Parameters
  parameter Temperature T0=100 "Initial temperature";
  parameter ConvectionCoefficient h=767 "Convective cooling coefficient";
  parameter Area A=1.0 "Surface area";
  parameter Mass m=1 "Mass of thermal capacitance";
  parameter SpecificHeat c_p=4200 "Specific heat";

  // Variables
  Temperature T_inf "Ambient temperature";
  Temperature T "Temperature";
initial equation
  T = T0 "Specify initial value for T";
equation
  if time<=0.5 then
    T_inf = 25 "Constant temperature when time<=0.5";
  else
    T_inf = 0 "Otherwise, increasing";
  end if;
  m*c_p*der(T) = h*A*(T_inf-T) "Newton's law of cooling";
end NewtonCoolingDynamic1;
