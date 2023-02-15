%% Lab 3 
% Jaiden Kazemini
% ECE2245


function H = Hjw_measured(omega)

r1 = 9.95e3;
L = 0.095;
c1 = 31.5e-9;
c2 = 245e-9;

zc1 = -j/(omega *c1); %#ok<*IJCL>
zc2 = -j/(omega *c2);
z1 = (j * omega * L);

zab = (zc1 * (zc2+z1))/(zc1+zc2+z1);

H = zab / (r1+zab); 

return 
end