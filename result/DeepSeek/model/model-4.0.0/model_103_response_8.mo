class DAEexample
  parameter Real a = 0.9; // initial value of x
  parameter Real b = 0.5; // coefficient for the differential equation
  parameter Real c = 1.0; // coefficient for the differential equation
  parameter Real d = 0.9; // coefficient for the algebraic equation
  Real x(start = a); // state variable x
  Real y(start = 0); // state variable y
  Real t; // time
equation
  der(x) = -b*sin(y)*x + c*sin(t); // differential equation for x
  x - y = d*exp(-d*x)*cos(y); // algebraic equation
  annotation(experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 1e-3));
end DAEexample;