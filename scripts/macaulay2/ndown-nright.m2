--------------------------------------------------------
-- Topology identifiability N_down vs N_right         --
--------------------------------------------------------
-- To run in console: cat ndown-nright.m2 | M2 &> ndown-nright_out.txt
-- we call z's the variables on N_down, and u's the variables in N_right
-- gz: gamma for N_down; gu: gamma for N_right
-- Note that we only include one (or 2) equation per quartet (as all three CF sum up to 1)

R = QQ[gz, z0, z02, z2, z23, z3, z13, z1, z01, gu, u0, u02, u2, u23, u3, u13, u1, u01]

I = ideal(z2*z23*z3 - (1 − gu)^2*u2*u0*u01*u13*u23 - 2*gu*(1 − gu)*u2*u0 - gu^2*u2*u0*u02,
z23*z2 - (1 − gu)^2*u0*u13*u01 - gu*(1 − gu)*u0*(3-u23) - gu^2*u0*u02,
z3 - (1 − gu)*u23*u2 - gu*u2,
z2*z23*z13*z1 - (1 − gu)^2*u3*u0*u13*u01 - 2*gu*(1 − gu)*u3*u0 - gu^2*u3*u0*u23*u02,
z13*z1 - (1 − gu)*u3 - gu*u23*u3,
z3*z13*z1 - u2*u23*u3,
(1 − gz)*z23*z2 + gz*z2 - (1 − gu)^2*u0*u01 - gu*(1 − gu)*u0*(3-u23*u13) - gu^2*u0*u02,
(1 − gz)*z3 + gz*z23*z3 - (1 − gu)*u13*u23*u2 - gu*u2,
(1 − gz)*z13*z23*z2 + gz*z2 - (1 − gu)^2*u0*u01 - gu*(1 − gu)*u0*(3-u13) - gu^2*u0*u02*u23,
(1 − gz)*z13*z3 + gz*z3 - u23*u2,
(1 − gz)*z1 + gz*z23*z13*z1 - (1 − gu)*u13*u3 - gu*u3,
(1 − gz)*z1 + gz*z13*z1 - u3,
(1 − gz)^2*z2*z0*z01*z13*z23 + 2*gz*(1 − gz)*z2*z0 + gz^2*z2*z0*z02 - (1 − gu)^2*u1*u0*u01 - 2*gu*(1 − gu)*u1*u0 - gu^2*u1*u0*u02*u23*u13,
(1 − gz)^2*z0*z13*z01 + gz*(1 − gz)*z0*(3-z23)+ gz^2*z0*z02 - (1 − gu)*u1 - gu*u23*u13*u1,
(1 − gz)^2*z3*z0*z13*z01 + 2*gz*(1 − gz)*z3*z0 + gz^2*z3*z0*z23*z02 - u2*u23*u13*u1,
(1 − gz)^2*z0*z01 + gz*(1 − gz)*z0*(3-z23*z13)+gz^2*z0*z02 - (1 − gu)*u1 - gu*u13*u1,
(1 − gz)^2*z0*z01 + gz*(1 − gz)*z0*(3-z13)+gz^2*z0*z02*z23 - u13*u1,
(1 − gz)^2*z1*z0*z01 + 2*gz*(1 − gz)*z1*z0 + gz^2*z1*z0*z02*z23*z13 - u3*u13*u1,
(1 − gz)*(3 − 2*z13) + gz*z23 - (1 − gu)*u01 - gu*(3 − 2*u13),
(1 - gz)*z13 + gz*(3-2*z23) - (1 − gu)*(3 −2*u01) - gu*u13)


G = eliminate(I,{gu, u0, u02, u2, u23, u3, u13, u1, u01})


