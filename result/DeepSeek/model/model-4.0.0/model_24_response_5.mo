model ExampleUsage
 Real a = 1;
  Real b = 1;
  Real T;
equation 
  T = largerTimeConstant(a, b);
end ExampleUsage;