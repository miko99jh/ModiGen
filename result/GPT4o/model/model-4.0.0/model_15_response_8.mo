model SmoothStep
 extends IndustrialControlSystems.MathOperations.RealType.Interfaces.RealNinOperation(
    final useInputs = false,
    final FixedPoint = false,
    final Nbit = 1,
    final scaleFactor = 1,
    final MAX = 1,
    final MIN = 0);

  // Parameters
  parameter Real tin = 10 "Initial time for the smooth step [s]";
  parameter Real alfa = 0.1 "Portion of time for parabolic junctions [dimensionless, range: 0 to 1]";
  parameter Real yin = 0 "Output initial value [dimensionless]";
  parameter Real yfin = 1 "Output final value [dimensionless]";
  parameter Real m = 0.1 "Slope of the ramp [dimensionless]";

  // Variables
  Real y "Output value";

  // Equations
  equation
    // Ensure alfa is within the valid range
    assert(alfa >= 0 and alfa <= 1, "alfa out of range [0,1]");

    // Calculate the smooth step transition
    y = IndustrialControlSystems.MathOperations.RealType.Functions.fSmoothStep(time, tin, alfa, m, yin, yfin);

    // Fixed-point representation not used
    Ufp = zeros(nInput);
    Yfp = 0;
end SmoothStep;