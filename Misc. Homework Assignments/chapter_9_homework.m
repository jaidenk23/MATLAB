%% Jaiden Kazemini
% Assignment #8 - Chapter 9
% ENGR1040

%% 9.1 Use a for loop to sum the elements in the following vector:
% x=[1, 23, 43, 72, 87, 56, 98, 33]

x = [1,23,43,72,87,56,98,33];
clear sum; 
a = 0;
for i=1:length(x)
    a=a+x(i);
end
disp('The sum of the vector is: ');
disp(a);
disp('The sum of the vector using sum function is: ');
disp(sum(x));

%% 9.2 Repeat the previous problem, this time using a while loop.

x = [1,23,43,72,87,56,98,33];
a = 0;
i=1;
while i<=length(x)
    a=a+x(i);
    i=i+1;
end
disp('The sum of the vector is: ');
disp(a);
disp('The sum of the vector using sum function is: ');
disp(sum(x));

%% 9.3 Use a for loop to create a vector of the squares of the numbers 1 through 5.

a = zeros(1,5);
for k=1:5
    a(k)=k.^2;
end
disp('Squares of the numbers 1 - 5: ');
disp(a);

%% 9.4 Use a while loop to create a vector of the squares of the numbers 1 
% through 5.

k = 1;
a = zeros(1,5);
while k<=5
    a(k)=k.^2;
    k=k+1;
end
disp('Squares of the numbers 1 - 5: ');
disp(a);

%% 9.5 Use the primes function to create a list of all the primes below 
% 100. Now use a for loop to multiply adjacent values together.

p = primes(100);
disp('The prime numbers below 100 are: ');
disp(p);
a = zeros(1,length(p)-1);
for i=1:length(p)-1
    a(i)=p(i).*p(i+1);
end
disp('The vector with adjacent values of p multiplied together are: ');
disp(a);

%% 9.6 Prompt the user to enter the first two numbers in a Fibonacci 
% sequence, and  the  total  number  of  elements  requested  for  the  
% sequence. Find  the  sequence and store it in an array by using a for loop. 
% Now plot your results on a polarplot graph. Use the element number for the 
% angle, and the value of the element in the sequence for the radius.

x = input('Enter the first number in Fibonacci sequence: ');
y = input('Enter the second number in Fibonacci sequence: ');
z = input('Enter the third number in Fibonacci sequence: ');
a = zeros(1,z);
a(1) = x;
a(2) = y;

for i=3:z
    a(i)=a(i-1)+a(i-2);
end

fprintf('The Fibonacci sequence is: ');
fprintf('%1d ',a);
fprintf('\n');

i = 1:z;
polarplot(i,a(i));

%% 9.7 Repeat the preceding problem, this time using a while loop.

x = input('Enter the first number in Fibonacci sequence: ');
y = input('Enter the second number in Fibonacci sequence: ');
z = input('Enter the third number in Fibonacci sequence: ');
a = zeros(1,z);
a(1) = x;
a(2) = y;
i = 3;

while(i<=z)
    a(i)=a(i-1)+a(i-2);
    i=i+1;
end

fprintf('The Fibonacci sequence is: ');
fprintf('%1d ',a);
fprintf('\n');

i = 1:z;
polarplot(i,a(i));

%% 9.8 Create a program that accepts the first two numbers of a Fibonacci 
% sequence as user input, then calculates additional values in the sequence 
% until the ratio of adjacent values converges to within 0.001

x = input('Enter the first number in Fibonacci sequence: ');
y = input('Enter the second number in Fibonacci sequence: ');
clear a;
a(1) = x;
a(2) = y;
i = 3;
a(i)=a(i-1)+a(i-2);

while abs(a(i)/a(i-1)/a(i-2))>0.001
    i=i+1;
    a(i)=a(i-1)+a(i-2);
end

disp(a);

%% 9.13 Write a MATLAB® function called my_sqrt that approximates the square 
% root of a number. It should have two inputs, the initial guess and the 
% convergence criterion.

my_sqrt(2,0.01)

sqrt(5) % test to see if the function has the same output

%% 9.14 Use  a  midpoint  break  loop  to  determine  how  many  terms  must  
% be  included  in  the  summation,  in  order  to  find  the  correct  value  
% of  cos(2)  within an error of.001. Limit the number of iterations to a 
% maximum of 10.

error = 0.001;
x = 2;
AV = cos(x);
sum = 0;

for k=1:10
    T=((-1)^(k-1))*((x^((k-1)*2))/factorial((k-1)*2));
    sum=sum+T;
    if(abs(sum-AV)<=error)
        break
    end
end
fprintf('The number of terms in the summation is %2d\n',k)
fprintf('The value of cos(2) is %0.3f\n',sum)

%% 9.15 Create a function called my_sin, using a midpoint break loop to 
% approximate the value of sin(x). Determine convergence by comparing 
% successive values of the summation as you add additional terms. These 
% successive sums should be within an absolute value of 0.001 of each other. 
% Test your function by evaluating the my_sin(2) and comparing it to the 
% built-in MATLAB® sine function.

my_sin(2)

sin(2) % test to see if the function has the same output

%% 9.16 Calculate p, using a midpoint break loop. Determine convergence by 
% comparing successive values of the summation as you add additional terms 
% until the difference between successive sums is less than 0.001. Set the 
% maximum number of iterations to 3000.

piApprox=0;
i=1;

while true
term = (-1)^(i+1)*4/(2*i-1);
if i>3000
fprintf('Iteration limit reached!!!\n')
break
end
if abs((term+piApprox)-piApprox)<.001
fprintf('Successfully converged\n')
break
end
piApprox=piApprox+term;
i=i+1;
end

fprintf('Calculated value: %f\n',piApprox)

%% 9.18 In the previous chapter, the Lake Powell water elevation data were 
% evaluated using the find function. Repeat the calculations, using a nested 
% loop structure. The file lake_powell.dat contains the data listed in Table 
% 8.10.


% I commented this section in more detail than the others
% due to the length and "complexity" of it. 

% a)

clc

load lake_powell.dat

years=[2000 2001 2002 2003 2004 2005 2006 2007];

%Find the size of the data matrix

[r,c]=size(lake_powell);

% Make a 1x8 matrix with zeros intially 

% to store the averages of each year.

avg_years=zeros(1,8);

%Find the average elevation of each year,

% using nested loops.

for i=1:c

    for j=1:r

        %Sum the all values in the column i and store

        % the sum in the "ith" location of avg_years.

        avg_years(i)=avg_years(i)+lake_powell(j,i);

    end   

    % Divide the sum with r(12) to get the average.

    avg_years(i)=avg_years(i)/r;

end

% Print the averages of all years

for i=1:c

    fprintf('Average elevation for the year %d is %.4f \n',years(i),avg_years(i))

end

% b)

clc

load lake_powell.dat

years=[2000 2001 2002 2003 2004 2005 2006 2007];

% Find the size of the data matrix

[r,c]=size(lake_powell);

% Make a 1x8 matrix with zeros intially,

% to store count of months

count_months=zeros(1,8);

for i=1:c

    for j=1:r

        % Increment the corresponding counter, if the

        % elevation of water of "jth" month is greater than

        % the average of the "ith" year

        if lake_powell(j,i) > avg_years(i)

           count_months(i) =count_months(i) +1;

        end

    end

end

% Print the averages of all years

for i=1:c

    fprintf('%d months exceeds the average elevation of the year %d \n',count_months(i),years(i))

end

% c)

clc

load lake_powell.dat

years=[2000 2001 2002 2003 2004 2005 2006 2007];

% Find the size of the data matrix

[r,c]=size(lake_powell);

% Declare a variable to store the overall sum

sum=0;

for i=1:c

    for j=1:r

        % Sum all the values of the data table

           sum =sum+lake_powell(j,i);

    end

end

% Find overall average

overall_avg=sum/(r*c);

fprintf('overall average= %f\n',overall_avg);

% Print the report

for i=1:c

    for j=1:r

        if lake_powell(j,i) > overall_avg

            fprintf('month %d of year %d exceeds the overall average elevation \n',j,years(i))

        end

    end

end

% d)

clc

load lake_powell.dat

years=[2000 2001 2002 2003 2004 2005 2006 2007];

% Find the size of the data matrix

[r,c]=size(lake_powell);

% Make a 1x12 matrix with zeros intially,

% to store averages of each month over the 8 year period.

avg_months=zeros(1,12);

for i=1:r

    for j=1:c

        % Sum all the values in the row i and store

        % the sum in the "jth" location of avg_months.

        avg_months(i)= avg_months(i)+lake_powell(i,j);

    end

    % Divide the sum with c(8) to get the average

    avg_months(i)=avg_months(i)/c;

end

% Print the averages of all years

for i=1:r

    fprintf('Average elevation for the month %d is %.4f \n',i,avg_months(i))

end

%% 9.19

% a) Generate a 100,000-item vector of random digits called x; square each 
% element in this vector and name the result y; use the commands ticand toc 
% to time the operation.
x = rand(100000,11);
tic
y = x.^2
toc

% b) Next, perform the same operation element by element in a for loop. 
% Before you start, clear the values in your variables withclear x yUse tic 
% and toc to time the operation.Depending on how fast your computer runs, you 
% may need to stop the calculations by issuing the Ctrl c command in the 
% command window.
clear x y;
x = rand(100000,1);
tic
for i=1:length(x(:))
    y(i) = x(i).^2
end
toc

% c) Now convince yourself that suppressing the printing of intermediate 
% answers will speed up execution of the code by allowing these same 
% operations to run and print the answers as they are calculated. You will
% almost undoubtedly need to cancel the execution of this loop because of the 
% large amount of time it takes. Recall that Ctrl cterminates the program.
clear x y;
x = rand(100000,1);
tic
for i=1:length(x(:));
    y(i) = x(i).^2;
end
toc

% d) If you are going to use a constant value several times in a for loop, 
% calculate it once and store it, rather than calculating it each time 
% through the loop. Demonstrate the increase in speed of this process by 
% adding (sin(0.3) + cos(pi/3))*5! to every value in the long vector in a for 
% loop. (Recall that ! means factorial, which can be calculated with the 
% MATLAB® function factorial.)
clear x y;
x = rand(100000,1);
tic
for i=1:length(x(:))
    y(i) = x(i)+(((sin(0.3)+cos(pi/3))*factorial(5)));
end
toc

% e) As discussed in this chapter, if MATLAB® must increase the size of a 
% vector every time through a loop, the process will take more time than if 
% the vector were already the appropriate size. Demonstrate this fact by 
% repeating part (b) of this problem. Create the following vector of 
% y-values, in which every element is equal to zero before you enter the for 
% loop:y = zeros(1,100000); You will be replacing the zeros one at a time as 
% you repeat the calculations in the loop.
clear x y;
x = rand(100000,1);
y = zeros(100000,1);
tic
for i=1:length(x(:))
    y(i) = x(i).^2;
end
toc

%% 9.20 Create a function called polygon that draws a polygon in a polar 
% plot. Your function should have a single input parameter—the number of 
% sides. Use a for loop to create a figure with four subplots, showing a 
% triangle in the first subplot, a square in the second subplot, a pentagon 
% in the third subplot, and a hexagon in the fourth subplot. You should use 
% the function you created in part (a) to draw each polygon. Use the index 
% parameter from the for loop to specify the subplot in which each polygon 
% is drawn, and in an expression to determine the number of sides used as 
% input to the polygon function.

% a)
polygon(4)

% b)
for n=3:1:6
    subplot(2,2,n-2)
    polygon(n)
end

%% 9.21 Write a function called eapprox that takes the value of K as input, 
% and which then approximates e using the method described above. Test your 
% function several times with different values of K, and compare the result 
% to the value of e calculated using the built-in MATLAB® function.

eapprox(5)

eapprox(6)

exp(1)

%% 9.22 Vectorize  (replace  loops  with  a  single  statement)  the  
% calculations  in  the  function created in the previous problem, by using 
% the built-in MATLAB®functions histcounts and sum.

eapprox1(5)

eapprox1(100)

exp(1)

%% Functions

function [root_A] = my_sqrt(x,e)
A = 5;
x(1) = x;
i = 1;
y = zeros;
while(1)
    y(i)=x(i).^2./A;
    x(i+1)=(x(i)/8)*(15-y(i)*(10-(3*y(i))));
    if abs(x(i+1)-x(i))<=e
        break
    end
    i=i+1;
end
root_A = x(i+1);
end


function sinx = my_sin(x)
y = zeros;
s = zeros;
s(1) = x;
criterion = 0.001;
for k=2:1000
     y(k)=(-1)^(k-1)*x^(2*k-1)/(factorial(2*k-1));
     s(k)=s(k-1)+y(k);
     error=abs(s(k)-s(k-1));
     if error<=criterion
         break
     end
end
sinx=s(k);
end

function [] = polygon(n)
clear a r x y
a = rand(n,1);
a = 2*pi*(rand+cumsum(a/sum(a))); 
r = rand(n,1);
r = r/sum(r);
x = cumsum(r.*cos(a));
y = cumsum(r.*sin(a));
r = cumsum(r);
x = rand+[0;x-x(n)*r];
y = rand+[0;y-y(n)*r];
polar(x,y)
end

function [e] = eapprox(K)
R = randi([1,K],K,1);
fprintf('Random numbers: \n')
disp(R)
instances = zeros;
for i=1:K
    x=0;
    for j=1:K
        if R(j)==i
            x=x+1;
        end 
    end
    instances (i,:)=x;
end
instances(i,:)=x;
fprintf('Instances:\n')
disp(instances)
J=0;
for a=1:K
    if instances(a)==0
        J=J+1;
    end 
end
fprintf('The never generated numbers count is: %f\n',J)
e=K/J;
fprintf('The value of e is: %f',e)
end

function [] = eapprox1(K)
a = randi(K,K,1);
Instances = histcounts(a,K);
J = sum(Instances==0);
e=K/J;
fprintf('The value of e is: %f\n',e)
end
