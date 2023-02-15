%% Lab 3 
% Jaiden Kazemini
% ECE2245

function H = Hjw_ideal(omega)

%omega = omega * le3

r1 = 10e3;
L = 0.1;
c1 = 32e-9;
c2 = 253e-9;

zc1 = -j/(omega *c1);
zc2 = -j/(omega *c2);
z1 = (j * omega * L); %#ok<*IJCL>

zab = (zc1 * (zc2+z1))/(zc1+zc2+z1);

H = zab / (r1+zab); 

return 
end