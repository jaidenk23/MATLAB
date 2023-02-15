clear, clc
format short eng
Vf = -9; Vi = 9;
c1 = 1e-7;
Vc = Vf.*.9;

%% for 3 hz
t1 = [1/6];
tau1 = (-t1)./log((Vc-Vf)./(Vi-Vf));
r3a = tau1./c1;
disp('R3 is equal to at 3Hz: ')
disp(r3a)
%% for 100 hz
t2 = [1/200];
tau2 = (-t2)./log((Vc-Vf)./(Vi-Vf));
r3b = tau2./c1;
disp('R3 is equal to at 100Hz: ')
disp(r3b)