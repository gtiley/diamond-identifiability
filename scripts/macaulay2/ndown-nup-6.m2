--------------------------------------------------------
-- Topology identifiability N_down vs N_up         --
--------------------------------------------------------
-- To run in console: cat ndown-nup.m2 | M2 &> ndown-nup_out.txt
-- we call z's the variables on N_down, and w's the variables in N_up
-- gz: gamma for N_down; gw: gamma for N_up
-- Note that we only include one (or 2) equation per quartet (as all three CF sum up to 1)

R = QQ[gz, z23, z3, z13, z1, gw, w0, w02, w2, w23, w13, w01]

I = ideal(
z3 - (1 - gw)^2*w0*w01 - gw*(1 - gw)*w0*(3-w23*w13) - gw^2*w0*w02,
z13*z1 - (1 - gw)*w13*w23*w2 - gw*w2,
z3*z13*z1 - (1 - gw)^2*w2*w0*w01*w13*w23 - 2*gw*(1 - gw)*w2*w0 - gw^2*w2*w0*w02,
(1 - gz)*z3 + gz*z23*z3 - (1 - gw)^2*w0*w01 - gw*(1 - gw)*w0*(3-w13) - gw^2*w0*w02*w23,
(1 - gz)*z13*z3 + gz*z3 - (1 - gw)^2*w0*w13*w01 - gw*(1 - gw)*w0*(3-w23) - gw^2*w0*w02,
(1 - gz)*z1 + gz*z23*z13*z1 - w23*w2,
(1 - gz)*z1 + gz*z13*z1 - (1 - gw)*w23*w2 - gw*w2,
(1 - gz)*(3 - 2*z13) + gz*z23 - (1 - gw)*(3-2*w02) - gw*w01,
(1 - gz)*z13 + gz*(3-2*z23) - (1 - gw)*w02 - gw*(3-2*w01))


G = eliminate(I,{gw, w0, w02, w2, w23, w13, w01})


