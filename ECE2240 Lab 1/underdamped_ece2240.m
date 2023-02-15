%% Jaiden Kazemini
% Lab 1 - ECE2240

% plot of i underdamped

t = 0:0.000005:0.002; 
i = 0.475.*exp(-4375*t).*sin(78935.8*t);

plot(t,i)
title('i underdamped')
xlabel('t in seconds')
ylabel('i(t)')