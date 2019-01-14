Y = [1/3 0 0; 0 1/3 0; 0 0 -2/3];
I3  = (1/2)*[1 0 0; 0 -1 0; 0 0 0];
syms t
assume(t,'real')
A = sym('A',[3 3]);

expm(-(2*pi*1i)*(I3+(1/2)*Y))
expm(-(pi*1i)*(I3+(1/2)*Y))
trace(expm(-(pi*1i)*(I3+(1/2)*Y)))