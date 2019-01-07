l1 = [0,1,0;1,0,0;0,0,0];
x = sym('x',[1,4]);
A = sym('A',[4,3,3]);
F = sym('F',[4,4,3,3]);

A(1,:,:) = x(1)*exp(-norm(x))*l1;
A(2,:,:) = x(2)*exp(-norm(x))*l1;
A(3,:,:) = x(3)*exp(-norm(x))*l1;
A(4,:,:) = x(4)*exp(-norm(x))*l1;

for ii = 1:4
    for jj = 1:4
        F(ii,jj,:,:) = diff(A(jj,:,:),x(ii)) - diff(A(ii,:,:),x(jj));
    end
end

I = trace(squeeze(F(4,1,:,:))*squeeze(F(2,3,:,:)));

int(I,x(1))