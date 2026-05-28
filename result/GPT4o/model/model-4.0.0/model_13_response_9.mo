block
    when sample(0, Ts) then
      y[1] = not Functions.Xor(u[:], nInput);
    end when;