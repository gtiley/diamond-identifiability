--------------------------------------------------------
-- Topology identifiability N_right vs N_left         --
--------------------------------------------------------
-- To run in console: cat nright-nleft.m2 | M2 &> nright-nleft_out.txt
-- we call u's the variables on N_right, and v's the variables in N_left
-- gu: gamma for N_right; gv: gamma for N_left
-- Note that we only include one (or 2) equation per quartet (as all three CF sum up to 1)

R = QQ[gu, u0, u02, u2, u23, u3, u13, u01, gv, v0, v02, v23, v3, v13, v1, v01]

I = ideal((1 - gu)^2*u2*u0*u01*u13*u23 + 2*gu*(1 - gu)*u2*u0 + gu^2*u2*u0*u02 - v3*v13*v1,
(1 - gu)^2*u0*u13*u01 + gu*(1 - gu)*u0*(3-u23) + gu^2*u0*u02 - (1 - gv)*v13*v3 - gv*v3,
(1 - gu)*u23*u2 + gu*u2 - (1 - gv)* v1 - gv*v13*v1,
(1 - gu)^2*u3*u0*u13*u01 + 2*gu*(1 - gu)*u3*u0 + gu^2*u3*u0*u23*u02 - (1 - gv)^2*v3*v0*v13*v01 - 2*gv*(1 - gv)*v3*v0 - gv^2*v3*v0*v23*v02,
(1 - gu)*u3 + gu*u23*u3 - (1 - gv)^2*v0*v01 - gv*(1 - gv)*v0*(3-v13) - gv^2*v0*v02*v23,
u2*u23*u3 - (1 - gv)^2*v1*v0*v01 - 2*gv*(1 - gv)*v1*v0 - gv^2*v1*v0*v02*v23*v13,
(1 - gu)^2*u0*u01 + gu*(1 - gu)*u0*(3-u23*u13) + gu^2*u0*u02 - v3,
(1 - gu)*u13*u23*u2 + gu*u2 - v13*v1,
(1 - gu)^2*u0*u01 + gu*(1 - gu)*u0*(3-u13) + gu^2*u0*u02*u23 - (1 - gv)*v3 - gv*v23*v3,
u23*u2 - (1 - gv)*v1 - gv*v23*v13*v1,
(1 - gu)*u13*u3 + gu*u3 - (1 - gv)^2*v0*v13*v01 - gv*(1 - gv)*v0*(3-v23) - gv^2*v0*v02,
u3 - (1 - gv)^2*v0*v01 - gv*(1 - gv)*v0*(3-v23*v13) - gv^2*v0*v02,
(1 - gu)*u01 + gu*(3 - 2*u13) - (1 - gv)*v23 - gv*(3 - 2*v02),
(1 - gu)*(3 -2*u01) + gu*u13 - (1 - gv)*(3-2*v23) - gv*v02)

G = eliminate(I,{gv, v0, v02, v23, v3, v13, v1, v01})


