model Test_StableBouncingBall
  ModelicaByExample.DiscreteBehavior.BouncingBall.StableBouncingBall ball(h0=2.0, e=0.9);
  Real height;
equation
  height=ball.h;
end Test_StableBouncingBall;
