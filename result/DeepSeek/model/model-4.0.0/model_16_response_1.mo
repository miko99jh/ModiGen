model MeanTest
 Real u[5] = {1, 2, 3, 4, 5};
      Real y;
    equation 
      y = RealType.Functions.Mean(u);
    end MeanTest;