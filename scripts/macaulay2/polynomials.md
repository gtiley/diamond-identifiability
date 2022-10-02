We have the polynomial equations from overleaf in the format for Macaulay2
Note that we keep just one equation per quartet (a minor one), except for the (1,1,1,1) quartet
for which we keep the 1st two equations.
All equations are multiplied by 3.
We change the variables (in overleaf they are all z's):
- N_down: z
- N_right: u
- N_left: v
- N_up: w

# N_down

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

# N_right

(1 − gz)^2*z2*z0*z01*z13*z23 + 2*gz*(1 − gz)*z2*z0 + gz^2*z2*z0*z02
(1 − gz)^2*z0*z13*z01 + gz*(1 − gz)*z0*(3-z23) + gz^2*z0*z02
(1 − gz)*z23*z2 + gz*z2
(1 − gz)^2*z3*z0*z13*z01 + 2*gz*(1 − gz)*z3*z0 + gz^2*z3*z0*z23*z02
(1 − gz)*z3 + gz*z23*z3
z2*z23*z3
(1 − gz)^2*z0*z01 + gz*(1 − gz)*z0*(3-z23*z13) + gz^2*z0*z02
(1 − gz)*z13*z23*z2 + gz*z2
(1 − gz)^2*z0*z01 + gz*(1 − gz)*z0*(3-z13) + gz^2*z0*z02*z23
z23*z2
(1 − gz)*z13*z3 + gz*z3
z3
(1 − gz)^2*z1*z0*z01 + 2*gz*(1 − gz)*z1*z0 + gz^2*z1*z0*z02*z23*z13
(1 − gz)*z1 + gz*z23*z13*z1
z2*z23*z13*z1
(1 − gz)*z1 + gz*z13*z1
z13*z1
z3z13z1
(1 − gz)*z01 + gz*(3 − 2*z13)
(1 − gz)*(3 −2*z01) + gz*z13

# N_left

z3*z13*z1
(1 − gz)*z13*z3 + gz*z3
(1 − gz)* z1 + gz*z13*z1
(1 − gz)^2*z3*z0*z13*z01 + 2*gz*(1 − gz)*z3*z0 + gz^2*z3*z0*z23*z02
(1 − gz)^2*z0*z01 + gz*(1 − gz)*z0*(3-z13)+ gz^2*z0*z02*z23
(1 − gz)^2*z1*z0*z01 + 2*gz*(1 − gz)*z1*z0 + gz^2*z1*z0*z02*z23*z13
z3
z13*z1
(1 − gz)*z3 + gz*z23*z3
(1 − gz)*z1 + gz*z23*z13*z1
(1 − gz)^2*z0*z13*z01 + gz*(1 − gz)*z0*(3-z23) + gz^2*z0*z02
(1 − gz)^2*z0*z01 + gz*(1 − gz)*z0*(3-z23*z13)+gz^2*z0*z02
z2*z23*z3
z23*z2
z2*z23*z13*z1
(1 − gz)*z23*z2 + gz*z2
(1 − gz)*z13*z23*z2 + gz*z2
(1 − gz)^2*z2*z0*z01*z13*z23 + 2*gz*(1 − gz)*z2*z0 + gz^2*z2*z0*z02
(1 − gz)*z23 + gz*(3 − 2*z02)
(1 − gz)*(3-2*z23) + gz*z02

# N_up

(1 − gz)^2*z1*z0*z01 + 2*gz*(1 − gz)*z1*z0 + gz^2*z1*z0*z02*z23*z13
(1 − gz)*z1 + gz*z23*z13*z1
(1 − gz)^2*z0*z01 + gz*(1 − gz)*z0*(3-z23*z13)+gz^2*z0*z02
z2*z23*z13*z1
(1 − gz)*z13*z23*z2 + gz*z2
(1 − gz)^2*z2*z0*z01*z13*z23 + 2*gz*(1 − gz)*z2*z0 + gz^2*z2*z0*z02
(1 − gz)*z1 + gz*z13*z1
(1 − gz)^2*z0*z01 + gz*(1 − gz)*z0*(3-z13)+gz^2*z0*z02*z23
z13*z1
(1 − gz)^2*z0*z13*z01 + gz*(1 − gz)*z0*(3-z23) + gz^2*z0*z02
z23*z2
(1 − gz)*z23*z2 + gz*z2
z3*z13*z1
(1 − gz)*z13*z3 + gz*z3
(1 − gz)^2*z3*z0*z13*z01 + 2*gz*(1 − gz)*z3*z0 + gz^2*z3*z0*z23*z02
z3
(1 − gz)*z3 + gz*z23*z3
z2*z23*z3
(1 − gz)*(3-2*z02) + gz*z01
(1 − gz)*z02 + gz*(3-2*z01)