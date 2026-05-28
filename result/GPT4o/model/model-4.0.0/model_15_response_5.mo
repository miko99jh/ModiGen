model SmoothStep
 extends IndustrialControlSystems.MathOperations.RealType.Interfaces.RealNinOperation(
    final useInputs=false, 
    final FixedPoint=false, 
    final Nbit=1, 
    final scaleFactor=1, 
    final MAX=1, 
    final MIN=0);

  parameter Real tin = 10 "Initial time for the smooth step [s]";
  parameter Real alfa = 0.1 "Portion of time for parabolic junctions [dimensionless, range: 0 to 1]";
  parameter Real yin = 0 "Output initial value [dimensionless]";
  parameter Real yfin = 1 "Output final value [dimensionless]";
  parameter Real m = 0.1 "Slope of the ramp [dimensionless]";

  Real y "Output value of the smooth step";

equation
  assert(alfa >= 0 and alfa <= 1, "alfa out of range [0,1]");
  y = IndustrialControlSystems.MathOperations.RealType.Functions.fSmoothStep(time, tin, alfa, m, yin, yfin);
  Ufp = zeros(nInput);
  Yfp = 0;
end SmoothStep;