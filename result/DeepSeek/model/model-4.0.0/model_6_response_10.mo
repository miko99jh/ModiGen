model TestTrackingFO
  parameter Real T = 0.4;
  parameter Real mu = 1;
  parameter Real Ymin = 0;
  parameter Real Ymax = 2;
  parameter Real amplitude = 5;
  parameter Real startTime = 4;
  parameter Real width = 2;
  parameter Real rising = 1;
  parameter Real falling = 1;
  parameter Real period = 8;
  parameter Real nperiod = 1;
  parameter Real height = 2;
  parameter Real startTime_step = 2;
  parameter Real width_pulse = 10;
  parameter Real period_pulse = 40;
  parameter Boolean useTS = true;

  Blocks.Sources.Step step(startTime = startTime_step, height = height);
  Blocks.Sources.BooleanPulse booleanPulse(startTime = startTime_pulse, width = width_pulse, period = period_pulse);
  Blocks.Sources.Trapezoid trapezoid(amplitude = amplitude, rising = rising, width = width, falling = falling, period = period, nperiod = nperiod, startTime = startTime);

  Controllers.Blocks.FO fo(mu = mu, T = T, useTS = useTS, Ymin = Ymin, Ymax = Ymax);
  Controllers.Blocks.FO fotr(mu = mu, T = T, useTS = true, Ymin = Ymin, Ymax = Ymax);
  Controllers.Blocks.FO fowa(mu = mu, AntiWindup = true, T = T, useTS = true, Ymin = Ymin, Ymax = Ymax);

equation 
  connect(step.y, fo.u);
  connect(step.y, fotr.u);
  connect(step.y, fowa.u);
  connect(booleanPulse.y, fo.TS);
  connect(booleanPulse.y, fotr.TS);
  connect(booleanPulse.y, fowa.TS);
  connect(trapezoid.y, fotr.TR);
  connect(trapezoid.y, fowa.TR);
end TestTrackingFO;