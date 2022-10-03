--------------------------------------------------------
-- Topology identifiability N_left vs N_up         --
--------------------------------------------------------
-- To run in console: cat nleft-nup.m2 | M2 &> nleft-nup_out.txt
-- we call v's the variables on N_leftt, and w's the variables in N_up
-- gv: gamma for N_left; gw: gamma for N_up
-- Note that we only include one (or 2) equation per quartet (as all three CF sum up to 1)

R = QQ[gv, v0, v02, v23, v3, v13, v1, v01, gw, w0, w02, w2, w23, w13, w1, w01]

I = ideal(v3*v13*v1 - (1 - gw)^2*w1*w0*w01 - 2*gw*(1 - gw)*w1*w0 - gw^2*w1*w0*w02*w23*w13,
(1 - gv)*v13*v3 + gv*v3 - (1 - gw)*w1 - gw*w23*w13*w1,
(1 - gv)* v1 + gv*v13*v1 - (1 - gw)^2*w0*w01 - gw*(1 - gw)*w0*(3-w23*w13) - gw^2*w0*w02,
(1 - gv)^2*v3*v0*v13*v01 + 2*gv*(1 - gv)*v3*v0 + gv^2*v3*v0*v23*v02 - w2*w23*w13*w1,
(1 - gv)^2*v0*v01 + gv*(1 - gv)*v0*(3-v13)+ gv^2*v0*v02*v23 - (1 - gw)*w13*w23*w2 - gw*w2,
(1 - gv)^2*v1*v0*v01 + 2*gv*(1 - gv)*v1*v0 + gv^2*v1*v0*v02*v23*v13 - (1 - gw)^2*w2*w0*w01*w13*w23 - 2*gw*(1 - gw)*w2*w0 - gw^2*w2*w0*w02,
v3 - (1 - gw)*w1 - gw*w13*w1,
v13*v1 - (1 - gw)^2*w0*w01 - gw*(1 - gw)*w0*(3-w13) - gw^2*w0*w02*w23,
(1 - gv)*v3 + gv*v23*v3 - w13*w1,
(1 - gv)*v1 + gv*v23*v13*v1 - (1 - gw)^2*w0*w13*w01 - gw*(1 - gw)*w0*(3-w23) - gw^2*w0*w02,
(1 - gv)^2*v0*v13*v01 + gv*(1 - gv)*v0*(3-v23) + gv^2*v0*v02 - w23*w2,
(1 - gv)^2*v0*v01 + gv*(1 - gv)*v0*(3-v23*v13)+gv^2*v0*v02 - (1 - gw)*w23*w2 - gw*w2,
(1 - gv)*v23 + gv*(3 - 2*v02) - (1 - gw)*(3-2*w02) - gw*w01,
(1 - gv)*(3-2*v23) + gv*v02 - (1 - gw)*w02 - gw*(3-2*w01))

G = eliminate(I,{gw, w0, w02, w2, w23, w13, w1, w01})


