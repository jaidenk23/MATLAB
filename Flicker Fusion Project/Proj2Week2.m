%% Flicker Fusion Project - Week 3
% Jaiden Kazemini


clear; close all; clc; 
% Start by simulating three voltage waveforms from component values

% The following temporary values need to be replaced with measured values.

% VOP is the maximum output Voltage of the Op-amp, which is slightly lower
% than the voltage of the Positive battery
VOP = +7.12;

% VON is the lowest output Voltage of the Op-amp, which is near the
% voltage of the Negative battery  
VON = -7.28;


% part values, including whatever resistance R3 is at the time
R1 = .991e6*(.75); R2 = 1.25e5*(1.29); R3 = 18e3*(1.22); R4 = .47e3*(1); 
C1 = 0.993e-7*(1);
% R2 was origanly 1.03e5
% VTP is the Positive Trip Voltage, a function using R1 and R2
VTP = VOP * R1/(R1+R2);

% VTN is the Negative Trip Voltage, using almost the same equation
VTN = VON * R1/(R1+R2);

% Initial conditions need to be used in calculating the Capacitor Voltage

% VC1f is the final voltage the capacitor would reach only if the OpAmp
% never switched direction
VC1f = VOP;

% VC1i is the initial voltage of the capacitor (what it reached the last
% time the OpAmp switched direction)
VC1i = VTN;

% t0 represents the last time the OpAmp switched direction
t0 = 0;

% tau is the time constant relating R3 and C1
tau = R3*C1;

% the plot should graph enough time to show several multiples of tau
endtime=26*tau;

% Prepare time values for calculations
time=linspace(0,endtime,1000);

% Prepare empty memory for loop calculations (MATLAB likes to have this
% done before a loop is started)
VC1=zeros(size(time)); % for the charging/discharging Capacitor Voltage
VTrip=zeros(size(time)); % for the changing Trip Voltage levels
VOut=zeros(size(time)); % for the changing output voltage of the OpAmp

% This loop calculates voltage levels in the circuit over simulated time
for k=1:length(time)

% The capacitor voltage formula is given here, but you need to specify the
% formulas for the Trip Voltage and Output Voltage.
    VC1(k)=VC1f-(VC1f-VC1i)*exp(-(time(k)-t0)/tau);
    % VTrip(k)=???;
    if VC1f >= VTP;
        VOut(k)= VOP;
        VTrip(k)=VTP;
    end
    if VC1f <= VTN;
        VOut(k)= VON;
        VTrip(k)=VTN;
    end
    
    
% HINT: Consider making a new variable to use when building VTrip(k).  You
% can control the new variables behavior in the "if" statements below, a
% bit like how VC1f is used in building VC1(k).
    
% As simulated time goes by, the capacitor reaches the Positive Trip
% Voltage and the OpAmp must react.  Some new values for the VC1 formula
% need to be set.
    if VC1(k)>=VTP
         VC1f=VON;   % New "final" capacitor voltage
         VC1i= VTP;   % New "initial" capacitor voltage
         t0=time(k);     % New "starting" time
        
% Once the capacitor switches to discharging, it will eventually reach the
% Negative Trip Voltage, meaning changes have to happen again
    elseif VC1(k)<=VTN
         VC1f= -VON;
         VC1i= -VTP;
         t0=time(k);
    end
end

% This section makes a plot showing the three important voltages in a way
% that is friendly to black and white printers 
plot(time,VC1,'Color',[.5 .5 .5],'linewidth',2)
hold on
plot(time,VTrip,'--','Color',[.5 .5 .5],'linewidth',2)
% TIP: 'Color',[.5 .5 .5] means make a line with 50% Red, 50% Green, and
% 50% Blue (this makes a mid level grey).
% 'linewidth',2 means make the
% line 2 pixels wide.
plot(time,VOut,':','Color',[.5 .5 .5],'linewidth',2)

ylim([-10 10]) % this line helps keep the graph to a useful zoom level
legend('V_C','V_T','V_O', 'capVc','capVt','capVO')
% TIP: underscores in legend entries make the next character as subscript
xlabel('Time')
ylabel('Voltage')
title('Voltage vs. Time')

% Compare your simulated results with the actual captured waveforms
% by plotting them on the same pair of axes. Your plot should look much
% like the one on the web page.

% Un-comment and modify the following code once you have data from an
% oscilloscope:

load FFFExcel.csv
capTime=FFFExcel(:,1) + .02148 ;
capVC1=FFFExcel(:,2);
capVO=FFFExcel(:,3);
capVT=FFFExcel(:,4);
grid on
hold on
plot(capTime, capVC1,  'Color',['red'],'linewidth',2)
plot(capTime, capVT, '--', 'Color',['green'], 'linewidth',2)
plot(capTime, capVO, ':', 'Color',[0.6350 0.0780 0.1840], 'linewidth',2)
legend('V_C','V_T','V_O', 'capVc','capVt','capVO' )
hold off