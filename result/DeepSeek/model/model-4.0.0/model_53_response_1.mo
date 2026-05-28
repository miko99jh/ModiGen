model HighPass
  parameter Modelica.Units.SI.Voltage Vin = 5 "Input voltage amplitude";
  parameter Modelica.Units.SI.Frequency f = 10 "Input frequency";
  parameter Modelica.Units.SI.Frequency fG = f/10 "Limiting frequency";
  Modelica.Electrical.Analog.Basic.Ground ground;
  Modelica.Electrical.Analog.Sensors.VoltageSensor vOut(start = Vin);
  Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.Derivative derivative(T = 1/(2*pi*fG), v(fixed = true));
  Modelica.Electrical.Analog.Sources.TrapezoidVoltage vIn(V = Vin, rising = 0.2/f, width = 0.3/f, falling = 0.2/f, period = 1/f, nperiod = -1, offset = 0, startTime = -(vIn.rising + vIn.width/2));
equation 
  connect(vIn.p, derivative.p1);
  connect(vIn.n, derivative.n1);
  connect(ground.p, vIn.n);
  connect(ground.p, derivative.n1);
  connect(derivative.p2, vOut.p);
  connect(derivative.n2, vOut.n);
end HighPass;