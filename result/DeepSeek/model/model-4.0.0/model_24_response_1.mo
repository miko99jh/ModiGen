model ExampleUsage
 Real a = 1;
  Real b = 0.25;
  Real T;
equation 
  T = largerTimeConstant(a, b);
end ExampleUsage;