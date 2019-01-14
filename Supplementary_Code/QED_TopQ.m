syms Ex Ey Ez Bx By Bz

F = [0 Ex Ey Ez; -Ex 0 -Bz By; -Ey Bz 0 -Bx; -Ez -By Bx 0];
Ft = [0 -Bx -By -Bz; Bx 0 Ez -Ey; By -Ez 0 Ex; Bz Ey -Ex 0];

trace(F*Ft)