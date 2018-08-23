x=linspace(0,2*pi);
re = cos(x).*sin(x);
im = sin(x).^2;

figure()
plot(re,im)