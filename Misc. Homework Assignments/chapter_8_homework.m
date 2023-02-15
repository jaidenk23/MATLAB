%% Jaiden Kazemini
% Assignment #7 - Chapter 8
% ENGR1040

%% 8.1

% a) 
v1 = [0,100;1,101;2,102;3,103;4,103;5,104;6,104;7,105;8,106;9,106;10,106;...
    11,105;12,104;13,103;14,101;15,100;16,99;17,100;18,102;19,104;20,106;...
    21,107;22,105;23,104;24,104];
a1 = find(v1>105)

% b)
b1 = length(a1)

% c)
time = v1(:,1);
temp = v1(:,2);
r = find(temp>105);
ans_c = time(r)

% d)
ans_d = length(find(temp<102))

% e)
a = find(temp<102);
ans_e = time(a)

% f)
b = find(temp>102&temp<105);
ans_f = time(b)

% g)
[r,c] = max(temp);
max_value = r
time_max = time(c)
%% 8.2

% a)
t = 0:2:100;
h = (2.13*(t.^2))-(0.0013*(t.^4))+(0.000034*(t.^4.751));
a_time = find(h>0);
a_ans = max(a_time);
t_ans = t(a_ans)

% b)

t = 0:2:100;
h = (2.13*(t.^2))-(0.0013*(t.^4))+(0.000034*(t.^4.751));
[h_m,time_index] = max(h);
H_max = h_m
Time_max = t(time_index)

% c)
t = 0:2:100;
h = (2.13*(t.^2))-(0.0013*(t.^4))+(0.000034*(t.^4.751));
times = find(h>=0);
heights = h(times);
plot(t(times),heights)
title('Positive values of height');
xlabel('time until rocket hits ground');
ylabel('height');
%% 8.3

% a)
tab = [1530,116,45,110;1240,114,42,115;2380,118,41,120;1470,124,38,95;...
    3590,126,61,118];
batch_number = tab(:,1);
temp = tab(:,2);
humidity = tab(:,3);
pressure = tab(:,4);
a_ans = find(temp>115&temp<125);
a = find(temp<115|temp>125);
fprintf('batch %2.0000f did meet the criterion for temperatures\n',[a_ans])
fprintf('batch %2.0000f did not meet the criterion for temperatures\n',[a])

% b)
b_ans = find(humidity>40&humidity<60);
b = find(humidity<40|humidity>60);
fprintf('batch %2.0f did meet the criterion for humidity\n',[b_ans])
fprintf('batch %2.0f did not meet the criterion for humidity\n',[b])

% c)
c_ans = find(pressure>100&pressure<200);
c = find(pressure<100|pressure>200);
fprintf('batch %2.0f did meet the criterion for pressure\n',[c_ans])
fprintf('batch %2.0f did not meet the criterion for pressure\n',[c])

% d)
d_ans = find((temp>115&temp<125)&(humidity>40&humidity<60)&...
(pressure>100&pressure<200));
d = find((temp<115|temp>125)|(humidity<40|humidity>60)|...
(pressure<100|pressure>200));
fprintf('batch %2.0f did meet the criterion for any one of the reasons\n',[d_ans])
fprintf('batch %2.0f did not meet the criterion for any one of the reasons\n',[d])

% e)
a_ans1 = size(find(temp>115&temp<125));
a1 = size(find(temp<115|temp>125));
b_ans1 = size(find(humidity>40&humidity<60));
b1 = size(find(humidity<40|humidity>60));
c_ans1 = size(find(pressure>100&pressure<200));
c1 = size(find(pressure<100|pressure>200));
i = size(batch_number);
p1 = a_ans1*100/i;
p2 = b_ans1*100/i;
p3 = c_ans1*100/i;
fprintf('%2.4f percent of motors passed for the temperature criterion\n',[p1])
fprintf('%2.4f percent of motors failed for the temperature criterion\n',[a1*100/i])
fprintf('%2.4f percent of motors passed for the humidity criterion\n',[p2])
fprintf('%2.4f percent of motors failed for the humidity criterion\n',[b1*100/i])
fprintf('%2.4f percent of motors passed for the pressure criterion\n',[p3])
fprintf('%2.4f percent of motors failed for the pressure criterion\n',[c1*100/i])
fprintf('%2.4f percentage is the total percentage rate\n',[(p1+p2+p3)/3])

%% 8.5

x = -3:0.05:5;
fv = f(x);
plot(x,fv)
xlabel('x')
ylabel('f(x)')
title('Plot of the function f(x)')

%% 8.6

x = -2*pi:0.01:2*pi;
gx = g(x);
plot(x,gx)
xlim([-2*pi 2*pi]);
ylim([-1.5 1.5]);
title('Plot of the function g(x)')
xlabel('x')
ylabel('g(x)')
%% 8.7
load temp.dat

% a)
hour = temp(:,1);
temp1 = temp(:,2);
temp2 = temp(:,3);
temp3 = temp(:,4);
[R,C] = find(temp>85);
tab1 = [R,C]

% b)
tempr1 = [temp1,temp2,temp3];
[r2,c2] = find(tempr1<65);
tab2 = [r2,c2+1]

% c)
temp = [temp1,temp2,temp3];
[max1,pos1] = max(temp);
[Max_temp,pos2] = max(max1);
Max_temp
Thermocouple_num = pos2
hour_val = pos1(pos2)
%% 8.8
load sea_ice_antarctic.dat

% a)
year = sea_ice_antarctic(:,1);
september = sea_ice_antarctic(:,2);
plot(year,september,'r')
hold on
february = sea_ice_antarctic(:,3);
plot(year,february,'b')
year1 = 1979:1:2010;
feb_avg = 3.04.*year1./year1;
plot(year1,feb_avg,'g')
sep_avg = 18.79.*year1./year1;
plot(year1,sep_avg,'c')
xlabel('year')
ylabel('Antarctic Sea Ice Extent (millions of square km)')

% b)
x = find(september>=18.79);
year(x)

% c)
y = find(february<=3.04);
year(y)
%% 8.9
load sea_ice_arctic.dat

% a)
year = sea_ice_arctic(:,1);
sep = sea_ice_arctic(:,2);
march = sea_ice_arctic(:,3);
plot(year,sep)
hold on
plot(year,march)
x = [1979 2010];
y = [15.52 15.52];
line(x,y)
x1 = [1979 2010];
y1 = [6.51 6.51];
line(x1,y1)
xlabel('year')
ylabel('ice extent')

% b)
e = find(sep>6.51);
for i=1:length(e)
    y(i)=year(e(i));
end
y

% c)
e1 = find(march<15.52);
for i=1:length(e1)
    y(i)=year(e1(i));
end
y

%% 8.10
load LAKE_POWELL.dat

% a)
y1 = LAKE_POWELL(:,1);
y2 = LAKE_POWELL(:,2);
y3 = LAKE_POWELL(:,3);
y4 = LAKE_POWELL(:,4);
y5 = LAKE_POWELL(:,5);
y6 = LAKE_POWELL(:,6);
y7 = LAKE_POWELL(:,7);
y8 = LAKE_POWELL(:,8);
lake_pow = [y1,y2,y3,y4,y5,y6,y7,y8];
avg = mean(lake_pow);
disp('average elevation of the water level is: ')
disp(avg)
years = [y1;y2;y3;y4;y5;y6;y7;y8];
avg1 = mean(years);
disp('average elevation for an 8-year period: ')
disp(avg1)

% b)
y = [2008,2009,2010,2011,2012,2013,2014,2015];
c1 = length(find(y1>avg1));
c2 = length(find(y2>avg1));
c3 = length(find(y3>avg1));
c4 = length(find(y4>avg1));
c5 = length(find(y5>avg1));
c6 = length(find(y6>avg1));
c7 = length(find(y7>avg1));
c8 = length(find(y8>avg1));
c = [c1,c2,c3,c4,c5,c6,c7,c8];
fprintf('%2.0f months of the year %1.0f exceed the overall average value\n',[c;y])

% c)
[rc,cc] = find(years'>avg1);
yy = y(rc);
table = [cc,yy]

% d)
avg2 = mean(years');
disp('The average elevation for each month for the 8-year period')
disp(avg2')
%% 8.11
x = input('Enter your body temperature: ');
if x>98.6
    disp('You have a fever');
end
%% 8.12
x = input('Enter the value of x: ');
y = input('Enter the value of y: ');
if x>y
    disp('x>y');
else
    disp('y>=x');
end
%% 8.13
my_asin(2.5)
my_asin(0.5)
%% 8.15

% a)
saws = [1,4,5,3,7,5,3,10,12,8,7,4];
if saws>=0
    disp('all valid')
else
    disp('invalid number found')
end

% b)
saws = [1,4,5,3,7,5,-3,10,12,8,7,4];
if saws>=0
    disp('all valid')
else
    disp('invalid number found')
end

%% 8.17

% a)
n = 3:6;
sum = (n-2)*180;
table = [n' sum']

% b)
clear all;
clc
n = input('Enter your choice:\n3.triangle\n4.square\n5.pentagon\n6.hexagon\n')
switch n
    case 3
        fprintf('sum of interior angles in the triangle is %3d',180)
    case 4
        fprintf('sum of interior angles in the square is %3d',(4-2)*180)
    case 5
        fprintf('sum of interior angles in the pentagon is %3d',(5-2)*180)
    case 6 
        fprintf('sum of interior angles in the hexagon is %3d',(6-2)*180)
    otherwise
        fprintf('You have entered the wrong choice. You have to enter index number of your choice')
end

% c)
clear all;
clc
n = menu('Enter your choice:','triangle','square','pentagon','hexagon');
switch n
    case 1
        fprintf('sum of interior angles in the triangle is',180);
    case 2
        fprintf('sum of interior angles in the square is',2*180);
        disp(2*180)
    case 3
        fprintf('sum of interior angles in the pentagon is',3*180);
    case 4
        fprintf('sum of interior angles in the hexagon is',4*180);
end

%% 8.20 (Extra Credit)
lot=menu('Which lot do you want to park at?','Long-Term (Economy) Lot','Short-term Lot');

disp('How long did you park in the lot?');

Weeks=input('Weeks:');

Days=input('Days:');

Hours=input('Hours:');

Minutes=input('Minutes:');

switch lot

case 1

bill=LongTermBill(Weeks,Days,Hours,Minutes);

case 2

bill=ShortTermBill(Weeks,Days,Hours,Minutes);

end

fprintf('\nTime Stayed:\n %3f Weeks\n %2f Days\n %2f Hours\n %2f Minutes\n Fee: %4f Dollars\n',Weeks,Days,Hours,Minutes,bill);


%% functions
function fx=f(x)
x1 = find(x<=2);
f1 = 2.*x(x1);
x2 = find(x>2);
f2 = x(x2).^2;
fx = [f1,f2];
end

function gx=g(x)
x1 = find(x<-pi);
gx(x1)=-1;

x2 = find(x>=-pi & x<=pi);
xs = x(x2);
gx(x2) = cos(xs);

x3 = find(x>pi);
gx(x3)=-1;
end

function result = my_asin(x)
if(-1<=x&x<=+1)
    disp(asin(x));
else
    disp('value entered is out of range')
end
end

function result=LongTermBill(w,d,h,m)

hours=h+(m/60); 

hours=ceil(hours);

if(hours>=6)

LTbill=(42*w)+(6*d)+6; 

else

LTbill=(42*w)+(6*d)+hours; 


end
result=LTbill;
end

function result=ShortTermBill(w,d,h,m)

minutes=((h*60)+m)-30;

MinutesPrice=minutes/20;

MinutesPrice=ceil(MinutesPrice);

WeekPrice=7*25; 

if(MinutesPrice>=25)

STbill=(WeekPrice*w)+(25*d)+25; 

else

STbill=(WeekPrice*w)+(25*d)+MinutesPrice; 


end
result=STbill;
end
