%% Jaiden Kazemini
% Lab 1 - ECE2240

% plot of i overdamped

t = 0:0.000005:0.01; 
i = 5.22.*exp(-784.6*t)-5.22.*exp(-7965.3*t);

plot(t,i)
title('i overdamped')
xlabel('t in seconds')
ylabel('i(t)')