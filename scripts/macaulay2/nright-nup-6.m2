--------------------------------------------------------
-- Topology identifiability N_right vs N_up         --
--------------------------------------------------------
-- To run in console: cat nright-nup.m2 | M2 &> nright-nup_out.txt
-- we call u's the variables on N_right, and w's the variables in N_up
-- gu: gamma for N_right; gw: gamma for N_up
-- Note that we only include one (or 2) equation per quartet (as all three CF sum up to 1)

R = QQ[gu, u2, u23, u3, u13, u01, gw, w0, w02, w2, w23, w13, w01]

I = ideal(
(1 - gu)*u23*u2 + gu*u2 - (1 - gw)^2*w0*w01 - gw*(1 - gw)*w0*(3-w23*w13) - gw^2*w0*w02,
(1 - gu)*u3 + gu*u23*u3 - (1 - gw)*w13*w23*w2 - gw*w2,
u2*u23*u3 - (1 - gw)^2*w2*w0*w01*w13*w23 - 2*gw*(1 - gw)*w2*w0 - gw^2*w2*w0*w02,
(1 - gu)*u13*u23*u2 + gu*u2 - (1 - gw)^2*w0*w01 - gw*(1 - gw)*w0*(3-w13) - gw^2*w0*w02*w23,
u23*u2 - (1 - gw)^2*w0*w13*w01 - gw*(1 - gw)*w0*(3-w23) - gw^2*w0*w02,
(1 - gu)*u13*u3 + gu*u3 - w23*w2,
u3 - (1 - gw)*w23*w2 - gw*w2,
(1 - gu)*u01 + gu*(3 - 2*u13) - (1 - gw)*(3-2*w02) - gw*w01,
(1 - gu)*(3 -2*u01) + gu*u13 - (1 - gw)*w02 - gw*(3-2*w01))

G = eliminate(I,{gw, w0, w02, w2, w23, w13, w01})


