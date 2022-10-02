--------------------------------------------------------
-- Topology identifiability N_down vs N_right         --
--------------------------------------------------------
-- To run in console: cat ndown-nright.m2 | M2 &> ndown-nright_out.txt
-- we call z's the variables on N_down, and u's the variables in N_right
-- gz: gamma for N_down; gu: gamma for N_right
-- Note that we only include one (or 2) equation per quartet (as all three CF sum up to 1)

R = QQ[gz, z0, z02, z2, z23, z3, z13, z1, z01, gu, u0, u02, u2, u23, u3, u13, u1, u01]

I = ideal( - (1-gu)^2*u2*u0*u01*u13*u23-2*gu*(1-gu)


G = eliminate(I,{gu, u0, u02, u2, u23, u3, u13, u1, u01})


