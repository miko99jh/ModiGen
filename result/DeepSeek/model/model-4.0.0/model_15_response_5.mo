model SmoothStep
  extends IndustrialControlSystems.MathOperations.RealType.Interfaces.RealNinOperation(
    useInputs=false, FixedPoint=false, Nbit = 1, scaleFactor = 1, MAX = 1, MIN = 0);
  parameter Real tin=10 "Initial time for the smooth step";
  parameter Real alfa=0.1 "Portion of time for parabolic junctions";
  parameter Real yin=0 "Output initial value";
  parameter Real yfin=1 "Output final value";
  parameter Real m=0.1 "Slope of the ramp";
  output Real y "Output";
equation 
  assert(alfa>=0 and alfa<=1, "alfa out of range [0,1]");
  y = IndustrialControlSystems.MathOperations.RealType.Functions.fSmoothStep(time, tin, alfa, m, yin, yfin);
  Ufp = zeros(nInput);
  Yfp = 0;
end SmoothStep;