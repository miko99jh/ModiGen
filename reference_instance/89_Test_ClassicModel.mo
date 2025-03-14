model Test_ClassicModel
  ModelicaByExample.BasicEquations.LotkaVolterra.ClassicModel classicModel(
    alpha=0.2,
    beta=0.04,
    gamma=0.5,
    delta=0.03,
    x0=20,
    y0=20);
  Real x,y;
equation
  x = classicModel.x;
  y = classicModel.y;
end Test_ClassicModel;
