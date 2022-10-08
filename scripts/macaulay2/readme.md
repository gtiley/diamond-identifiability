# To do
- we are running only the n=6 first


# Summary
I started this code by wanting to run all polynomial equations for n=8, n=7 and n=6 taxa, but midway realized that I only need the n=6 case. So, you can skip the sections of 8 taxa and 7 taxa.

# Testing macaulay2 locally

1. [Download M2](http://www2.macaulay2.com/Macaulay2/Downloads/)
```
brew install Macaulay2/tap/M2
```
2. I opened M2 and tested `ndown-nright.m2` line by line. I discovered that the minus symbols copied from latex were slightly different from `-`. So had to change them all.

# Jobs in WID server
```shell
ssh csolislemus@solislemus-001.discovery.wisc.edu
cd /mnt/dv/wid/projects4/Solis-Lemus-phylo-invariants/claudia
git clone https://github.com/gtiley/diamond-identifiability.git
module load M2-1.14
```

## Comparisons of networks with 8 taxa

I realized that we do not need to run these cases if n=7 are identifiable (bc you can always get rid of one taxa and be identifiable).
So, I will not run these cases.

### `ndown-nright.m2`

```shell
screen -S ndown-nright
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat ndown-nright.m2 | M2 &> ndown-nright_out.txt
```
Started 10/3 1030am. Error at 1:46pm `mmap(PROT_NONE) failed` and `Aborted (core dumped)`.
Started again 10/5 1047am. Same error!


### `ndown-nleft.m2`

```shell
screen -S ndown-nleft
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat ndown-nleft.m2 | M2 &> ndown-nleft_out.txt
```
Started 10/3 1035am. Still running 10/5 1048am. Error 10/5 1054am ``mmap(PROT_NONE) failed`, so maybe the error has to do with me starting other jobs!

### `ndown-nup.m2`

```shell
screen -S ndown-nup
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat ndown-nup.m2 | M2 &> ndown-nup_out.txt
```
Started 10/3 1035am. Error `mmap(PROT_NONE) failed` at 15:21 and `Aborted (core dumped)`.
Started again 10/5 1049am. Same error!

### `nright-nleft.m2`

```shell
screen -S nright-nleft
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat nright-nleft.m2 | M2 &> nright-nleft_out.txt
```
Started 10/3 1037am. Error `mmap(PROT_NONE) failed` at 14:05 and `Aborted (core dumped)`.
Started again 10/5 1051am. Same error.

### `nright-nup.m2`

```shell
screen -S nright-nup
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat nright-nup.m2 | M2 &> nright-nup_out.txt
```
Started 10/3 1037am. Error `mmap(PROT_NONE) failed` at 17:26 and `Aborted (core dumped)`.
Started again 10/5 1052am. Same error.

### `nleft-nup.m2`    

```shell
screen -S nleft-nup
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat nleft-nup.m2 | M2 &> nleft-nup_out.txt
```
Started 10/3 1040am. Error `mmap(PROT_NONE) failed` at 17:44 and `Aborted (core dumped)`.
Started again 10/5 1053am. Same error.

## Comparisons of networks with 7 taxa

### `ndown-nright-7.m2`

```shell
screen -S ndown-nright-7
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat ndown-nright-7.m2 | M2 &> ndown-nright-7_out.txt
```
Started 10/3 1pm. Finished 14:10.

### `ndown-nleft-7.m2`

```shell
screen -S ndown-nleft-7
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat ndown-nleft-7.m2 | M2 &> ndown-nleft-7_out.txt
```
Started 10/3 1pm. Finished at 13:52.

### `ndown-nup-7.m2`

```shell
screen -S ndown-nup-7
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat ndown-nup-7.m2 | M2 &> ndown-nup-7_out.txt
```
Started 10/3 104pm. Finished 20:29.

### `nright-nleft-7.m2`

```shell
screen -S nright-nleft-7
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat nright-nleft-7.m2 | M2 &> nright-nleft-7_out.txt
```
Started 10/3 105pm. Error `mmap(PROT_NONE) failed` at 21:11 and `Aborted (core dumped)`.
Started again 10/5 1058am. It was killed without any error.
Started again 10/8 942am. Still running 5pm.

### `nright-nup-7.m2`

```shell
screen -S nright-nup-7
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat nright-nup-7.m2 | M2 &> nright-nup-7_out.txt
```
Started 10/3 111pm. Error `mmap(PROT_NONE) failed` at 17:55 and `Aborted (core dumped)`.
Started again 10/5 1100am. Same error.
Started again 10/8 945am. Same error.
We are not restarting bc we are focusing on n=6 first.

### `nleft-nup-7.m2`    

```shell
screen -S nleft-nup-7
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat nleft-nup-7.m2 | M2 &> nleft-nup-7_out.txt
```
Started 10/3 112pm. Error `mmap(PROT_NONE) failed` at 21:08 and `Aborted (core dumped)`.
Started again 10/5 1101am. Killed without error.
Started again 10/8 945am. Same error.
We are not restarting bc we are focusing on n=6 first.

## Comparisons of networks with 6 taxa

### `ndown-nright-6.m2`

```shell
screen -S ndown-nright-6
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat ndown-nright-6.m2 | M2 &> ndown-nright-6_out.txt
```
Started 10/8 5pm. Finished 5:04pm.

### `ndown-nleft-6.m2`

```shell
screen -S ndown-nleft-6
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat ndown-nleft-6.m2 | M2 &> ndown-nleft-6_out.txt
```
Started 10/8 5pm. Finished 5:04pm.


### `ndown-nup-6.m2`

```shell
screen -S ndown-nup-6
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat ndown-nup-6.m2 | M2 &> ndown-nup-6_out.txt
```
Started 10/8 5pm.


### `nright-nleft-6.m2`

```shell
screen -S nright-nleft-6
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat nright-nleft-6.m2 | M2 &> nright-nleft-6_out.txt
```
Started 10/8 5pm.

### `nright-nup-6.m2`

```shell
screen -S nright-nup-6
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat nright-nup-6.m2 | M2 &> nright-nup-6_out.txt
```
Started 10/8 5pm.

### `nleft-nup-6.m2`    

```shell
screen -S nleft-nup-6
```

```shell
cd diamond-identifiability/scripts/macaulay2
cat nleft-nup-6.m2 | M2 &> nleft-nup-6_out.txt
```
Started 10/8 5pm.

# Summarizing Macaulay2 results

## Networks with 7 yaxa

```shell
cd Dropbox/Sharing/projects/present/george-diamond/diamond-identifiability/scripts/macaulay2/
```

We copied the file `text_convert.jl` created by Bella Wu [original repo](https://github.com/solislemuslab/phylo-invariants/blob/master/scripts/julia/text_convert.jl) to use the `macaulay_latex`function.

We have to change the function slightly because it expects the invariants to have `a` as variable. We also have to change `gz` for `z4` so that the same code works.

### ndown-nright-7_out.txt

```shell
sed 's/gz/z4/g' ndown-nright-7_out.txt > ndown-nright-7_out_gz-replaced.txt
```

Then, we move to `text_convert.jl`, and then we copy the result in latex.

In addition, I ran the same Macaulay script locally and included `factor(G_0)`,....,`factor(G_18)`. The output is copied and pasted in `ndown-nright-7_out-factor.txt`.


We will not summarize these cases yet as we will focus on n=6 for now:
- ndown-nleft-7_out.txt
- ndown-nup-7_out.txt


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