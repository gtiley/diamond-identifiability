--------------------------------------------------------
-- Topology identifiability N_down vs N_up         --
--------------------------------------------------------
-- To run in console: cat ndown-nup.m2 | M2 &> ndown-nup_out.txt
-- we call z's the variables on N_down, and w's the variables in N_up
-- gz: gamma for N_down; gw: gamma for N_up
-- Note that we only include one (or 2) equation per quartet (as all three CF sum up to 1)

R = QQ[gz, z0, z02, z2, z23, z3, z13, z1, z01, gw, w0, w02, w2, w23, w3, w13, w1, w01]

I = ideal(z2*z23*z3 - (1 - gw)^2*w1*w0*w01 - 2*gw*(1 - gw)*w1*w0 - gw^2*w1*w0*w02*w23*w13,
z23*z2 - (1 - gw)*w1 - gw*w23*w13*w1,
z3 - (1 - gw)^2*w0*w01 - gw*(1 - gw)*w0*(3-w23*w13) - gw^2*w0*w02,
z2*z23*z13*z1 - w2*w23*w13*w1,
z13*z1 - (1 - gw)*w13*w23*w2 - gw*w2,
z3*z13*z1 - (1 - gw)^2*w2*w0*w01*w13*w23 - 2*gw*(1 - gw)*w2*w0 - gw^2*w2*w0*w02,
(1 - gz)*z23*z2 + gz*z2 - (1 - gw)*w1 - gw*w13*w1,
(1 - gz)*z3 + gz*z23*z3 - (1 - gw)^2*w0*w01 - gw*(1 - gw)*w0*(3-w13) - gw^2*w0*w02*w23,
(1 - gz)*z13*z23*z2 + gz*z2 - w13*w1,
(1 - gz)*z13*z3 + gz*z3 - (1 - gw)^2*w0*w13*w01 - gw*(1 - gw)*w0*(3-w23) - gw^2*w0*w02,
(1 - gz)*z1 + gz*z23*z13*z1 - w23*w2,
(1 - gz)*z1 + gz*z13*z1 - (1 - gw)*w23*w2 - gw*w2,
(1 - gz)^2*z2*z0*z01*z13*z23 + 2*gz*(1 - gz)*z2*z0 + gz^2*z2*z0*z02 - w3*w13*w1,
(1 - gz)^2*z0*z13*z01 + gz*(1 - gz)*z0*(3-z23)+ gz^2*z0*z02 - (1 - gw)*w13*w3 - gw*w3,
(1 - gz)^2*z3*z0*z13*z01 + 2*gz*(1 - gz)*z3*z0 + gz^2*z3*z0*z23*z02 - (1 - gw)^2*w3*w0*w13*w01 - 2*gw*(1 - gw)*w3*w0 - gw^2*w3*w0*w23*w02,
(1 - gz)^2*z0*z01 + gz*(1 - gz)*z0*(3-z23*z13)+gz^2*z0*z02 - w3,
(1 - gz)^2*z0*z01 + gz*(1 - gz)*z0*(3-z13)+gz^2*z0*z02*z23 - (1 - gw)*w3 - gw*w23*w3,
(1 - gz)^2*z1*z0*z01 + 2*gz*(1 - gz)*z1*z0 + gz^2*z1*z0*z02*z23*z13 - w2*w23*w3,
(1 - gz)*(3 - 2*z13) + gz*z23 - (1 - gw)*(3-2*w02) - gw*w01,
(1 - gz)*z13 + gz*(3-2*z23) - (1 - gw)*w02 - gw*(3-2*w01))


G = eliminate(I,{gw, w0, w02, w2, w23, w3, w13, w1, w01})


