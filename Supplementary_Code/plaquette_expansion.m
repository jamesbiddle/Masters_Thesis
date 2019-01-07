syms A_m A_n A_mdag A_ndag a g

p = expand((1+1i*a*g*A_m)*(1+1i*a*g*A_n)*(1+1i*a*g*A_mdag)*(1+1i*a*g*A_ndag));
collect(p,a)