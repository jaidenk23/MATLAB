%% Lab 3
%Jaiden Kazemini
% ECE2245

pi = 3.145;
omega = linspace(0,6000*2*pi, 1000);
Harray_ideal = zeros(1,length(omega));
Harray_measured = zeros(1,length(omega));


for inx = 1:length(omega)
    Harray_ideal(inx) = abs(Hjw_ideal(omega(inx)));
end

for inx = 1:length(omega)
    Harray_measured(inx) = abs(Hjw_measured(omega(inx)));
end


figure(1)
plot(omega,Harray_ideal, omega, Harray_measured)
title('Frequency response of ideal and measured components')
xlabel('frequency')
ylabel('transfer function')
