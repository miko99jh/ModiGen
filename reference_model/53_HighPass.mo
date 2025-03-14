model HighPass "High-pass filter"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter Modelica.Units.SI.Voltage Vin=5 "Amplitude of input voltage";
  parameter Modelica.Units.SI.Frequency f=10 "Frequency of input voltage";
  parameter Modelica.Units.SI.Frequency fG=f/10 "Limiting frequency";
  Modelica.Electrical.Analog.Basic.Ground ground ;
  Modelica.Electrical.Analog.Sensors.VoltageSensor vOut ;
  Modelica.Electrical.Analog.Examples.OpAmps.OpAmpCircuits.Derivative derivative(T=1/(2*pi*fG),
   v(fixed=true));
  Modelica.Electrical.Analog.Sources.TrapezoidVoltage vIn(
   V=Vin,
   rising=0.2/f,
   width=0.3/f,
   falling=0.2/f,
   period=1/f,
   nperiod=-1,
   offset=0,
   startTime=-(vIn.rising + vIn.width/2));
equation
  connect(derivative.n1, ground.p);
  connect(derivative.p2, vOut.p);
  connect(derivative.n2, vOut.n);
  connect(vIn.p, derivative.p1);
  connect(vIn.n, derivative.n1);
end HighPass;
