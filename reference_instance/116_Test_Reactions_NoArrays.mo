model Test_Reactions_NoArrays
  ModelicaByExample.ArrayEquations.ChemicalReactions.Reactions_NoArrays reaction(
    k1=0.1, k2=0.15, k3=15);
  Real cA;
  Real cB;
  Real cX;
equation
  cA = reaction.cA;
  cB = reaction.cB;
  cX = reaction.cX;
end Test_Reactions_NoArrays;
