delta = eye(4);
k = sym('k', [1 4]);
syms a M
q = sym('q', [4 4]);
sum = 0;
D = sym('D', [4,4]);
term = sym(zeros(4));
den = sym(0);
num = sym(0);

for ii = 1:4
    for jj = 1:4
        q(ii,jj) = (1-delta(ii,jj))*(1+(1/12)*a^2*(k(ii)^2 + k(jj)^2));
        %q(ii,jj) = (1-delta(ii,jj));
    end
end

for ii = 1:4
    for jj = 1:4
        for kk = 1:4
            term(ii,jj) = term(ii,jj) + k(kk)*delta(jj,ii)*q(jj,kk)*k(kk) - k(jj)*delta(kk,ii)*q(jj,kk)*k(kk);
        end
            D(ii,jj) = (1/(k*transpose(k))^2)*(k(ii)*k(jj) + term(ii,jj));
    end
end

simplify(expand(1/trace(D)))

for ii = 1:4
   num = num + k(ii)^2;
   den = den + k(ii)^2 + (1/3)*k(ii)^4;
end
expand(num^2)