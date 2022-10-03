# Testing macaulay2 locally

1. [Download M2](http://www2.macaulay2.com/Macaulay2/Downloads/)
```
brew install Macaulay2/tap/M2
```

# Jobs in WID server
```shell
ssh csolislemus@solislemus-001.discovery.wisc.edu
cd /mnt/dv/wid/projects4/Solis-Lemus-phylo-invariants/claudia
git clone https://github.com/gtiley/diamond-identifiability.git
module load M2-1.14
```

## `ndown-nright.m2`

```shell
screen -S ndown-nright
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat ndown-nright.m2 | M2 &> ndown-nright_out.txt
```




ndown-nleft.m2  
ndown-nup.m2    
nright-nleft.m2 
nright-nup.m2
nleft-nup.m2    

# Polynomial equations for all networks

We have the polynomial equations from overleaf in the format for Macaulay2
Note that we keep just one equation per quartet (a minor one), except for the (1,1,1,1) quartet
for which we keep the 1st two equations.
All equations are multiplied by 3.
We change the variables (in overleaf they are all z's):
- N_down: z
- N_right: u
- N_left: v
- N_up: w

## N_down (z)

z2*z23*z3
z23*z2
z3
z2*z23*z13*z1
z13*z1
z3*z13*z1
(1 − gz)*z23*z2 + gz*z2
(1 − gz)*z3 + gz*z23*z3
(1 − gz)*z13*z23*z2 + gz*z2
(1 − gz)*z13*z3 + gz*z3
(1 − gz)*z1 + gz*z23*z13*z1
(1 − gz)*z1 + gz*z13*z1
(1 − gz)^2*z2*z0*z01*z13*z23 + 2*gz*(1 − gz)*z2*z0 + gz^2*z2*z0*z02
(1 − gz)^2*z0*z13*z01 + gz*(1 − gz)*z0*(3-z23)+ gz^2*z0*z02
(1 − gz)^2*z3*z0*z13*z01 + 2*gz*(1 − gz)*z3*z0 + gz^2*z3*z0*z23*z02
(1 − gz)^2*z0*z01 + gz*(1 − gz)*z0*(3-z23*z13)+gz^2*z0*z02
(1 − gz)^2*z0*z01 + gz*(1 − gz)*z0*(3-z13)+gz^2*z0*z02*z23
(1 − gz)^2*z1*z0*z01 + 2*gz*(1 − gz)*z1*z0 + gz^2*z1*z0*z02*z23*z13
(1 − gz)*(3 − 2*z13) + gz*z23
(1 - gz)*z13 + gz*(3-2*z23)

## N_right (u)

(1 − gu)^2*u2*u0*u01*u13*u23 + 2*gu*(1 − gu)*u2*u0 + gu^2*u2*u0*u02
(1 − gu)^2*u0*u13*u01 + gu*(1 − gu)*u0*(3-u23) + gu^2*u0*u02
(1 − gu)*u23*u2 + gu*u2
(1 − gu)^2*u3*u0*u13*u01 + 2*gu*(1 − gu)*u3*u0 + gu^2*u3*u0*u23*u02
(1 − gu)*u3 + gu*u23*u3
u2*u23*u3
(1 − gu)^2*u0*u01 + gu*(1 − gu)*u0*(3-u23*u13) + gu^2*u0*u02
(1 − gu)*u13*u23*u2 + gu*u2
(1 − gu)^2*u0*u01 + gu*(1 − gu)*u0*(3-u13) + gu^2*u0*u02*u23
u23*u2
(1 − gu)*u13*u3 + gu*u3
u3
(1 − gu)^2*u1*u0*u01 + 2*gu*(1 − gu)*u1*u0 + gu^2*u1*u0*u02*u23*u13
(1 − gu)*u1 + gu*u23*u13*u1
u2*u23*u13*u1
(1 − gu)*u1 + gu*u13*u1
u13*u1
u3*u13*u1
(1 − gu)*u01 + gu*(3 − 2*u13)
(1 − gu)*(3 −2*u01) + gu*u13

## N_left (v)

v3*v13*v1
(1 − gv)*v13*v3 + gv*v3
(1 − gv)* v1 + gv*v13*v1
(1 − gv)^2*v3*v0*v13*v01 + 2*gv*(1 − gv)*v3*v0 + gv^2*v3*v0*v23*v02
(1 − gv)^2*v0*v01 + gv*(1 − gv)*v0*(3-v13)+ gv^2*v0*v02*v23
(1 − gv)^2*v1*v0*v01 + 2*gv*(1 − gv)*v1*v0 + gv^2*v1*v0*v02*v23*v13
v3
v13*v1
(1 − gv)*v3 + gv*v23*v3
(1 − gv)*v1 + gv*v23*v13*v1
(1 − gv)^2*v0*v13*v01 + gv*(1 − gv)*v0*(3-v23) + gv^2*v0*v02
(1 − gv)^2*v0*v01 + gv*(1 − gv)*v0*(3-v23*v13)+gv^2*v0*v02
v2*v23*v3
v23*v2
v2*v23*v13*v1
(1 − gv)*v23*v2 + gv*v2
(1 − gv)*v13*v23*v2 + gv*v2
(1 − gv)^2*v2*v0*v01*v13*v23 + 2*gv*(1 − gv)*v2*v0 + gv^2*v2*v0*v02
(1 − gv)*v23 + gv*(3 − 2*v02)
(1 − gv)*(3-2*v23) + gv*v02

## N_up (w)

(1 − gw)^2*w1*w0*w01 + 2*gw*(1 − gw)*w1*w0 + gw^2*w1*w0*w02*w23*w13
(1 − gw)*w1 + gw*w23*w13*w1
(1 − gw)^2*w0*w01 + gw*(1 − gw)*w0*(3-w23*w13) + gw^2*w0*w02
w2*w23*w13*w1
(1 − gw)*w13*w23*w2 + gw*w2
(1 − gw)^2*w2*w0*w01*w13*w23 + 2*gw*(1 − gw)*w2*w0 + gw^2*w2*w0*w02
(1 − gw)*w1 + gw*w13*w1
(1 − gw)^2*w0*w01 + gw*(1 − gw)*w0*(3-w13) + gw^2*w0*w02*w23
w13*w1
(1 − gw)^2*w0*w13*w01 + gw*(1 − gw)*w0*(3-w23) + gw^2*w0*w02
w23*w2
(1 − gw)*w23*w2 + gw*w2
w3*w13*w1
(1 − gw)*w13*w3 + gw*w3
(1 − gw)^2*w3*w0*w13*w01 + 2*gw*(1 − gw)*w3*w0 + gw^2*w3*w0*w23*w02
w3
(1 − gw)*w3 + gw*w23*w3
w2*w23*w3
(1 − gw)*(3-2*w02) + gw*w01
(1 − gw)*w02 + gw*(3-2*w01)