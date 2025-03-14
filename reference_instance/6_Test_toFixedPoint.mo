model Test_toFixedPoint
  Integer y;
equation
  y = IndustrialControlSystems.MathOperations.RealType.Functions.toFixedPoint(3.14159, 100, 200, -200);
end Test_toFixedPoint;
