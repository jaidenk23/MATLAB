%% Jaiden Kazemini
% Assignment #9 - Chapter 10
% ENGR1040

%% 10.1 Compute the dot product of the following pairs of vectors, and 
% then show that A*B=B*A.
% a)
A = [1 3 5];
B = [-3 -2 4];
C = dot(A,B)
D = dot(B,A)

% b)
A = [0 -1 -4 -8];
B = [4 -2 -3 24];
C = dot(A,B)
D = dot(B,A)

%% 10.2 Compute the total mass of the components shown in Table P10.2, 
% using a dot product.

A = [1.2 7.8 2.7];
B = [700 200 300];
C = dot(A,B)

%% 10.3 Use a dot product and the shopping list in Table P10.3 to 
% determine your total bill at the grocery store.

A = [2 1 2 5 1];
B = [3.50 1.25 4.25 1.55 3.15];
C = dot(A,B)

%% 10.4 Bomb calorimeters are used to determine the energy released during 
% chemical reactions. The total heat capacity of a bomb calorimeter is 
% defined as the sum of the products of the mass of each component and the 
% specific heat capacity of each component. 

% Find the total heat capacity of a bomb calorimeter, using the thermal 
% data in Table P10.4.

A = [250 100 10];
B = [0.45 4.2 0.90];
C = dot(A,B)

%% 10.5 Organic  compounds  are  composed  primarily  of  carbon,  
% hydrogen,  and  oxygen, and for that reason are often called hydrocarbons. 
% The molecular weight (MW) of any compound is the sum of the products of 
% the number of atoms of each element (Z) and the atomic weight (AW) of each 
% element present in the compound.

% The atomic weights of carbon, hydrogen, and oxygen are approximately 12, 
% 1, and 16, respectively. Use a dot product to determine the molecular 
% weight of ethanol (C2H5OH), which has two carbon, one oxygen, and six 
% hydrogen atoms.

A = [12 1 16];
B = [2 6 1];
C = dot(A,B)

%% 10.6 It is often useful to think of air as a single substance with a 
% molecular weight (molar mass) determined by a weighted average of the 
% molecular weights of the different gases present. With little error, we 
% can estimate the molecular weight of air using in our calculation only 
% nitrogen, oxygen, and argon. Use a dot product and Table P10.6 to 
% approximate the molecular weight of air.

fraction = [0.78 0.21 0.01];
comp = [28 32 40];
mol_wt = dot(fraction,comp)

%% 10.7 Compute the matrix product a*B of the following pairs of matrices.
% Show that a*B is not the same as B*a.
% a)
A = [12 4;3 -5];
B = [2 12;0 0];
C = A*B
D = B*A

% b)
A = [1 3 5;2 4 6];
B = [-2 4;3 8;12 -2];
C = A*B
D = B*A

%% 10.8 You and a friend are both going to a grocery store. Your lists 
% are shown in Table P10.8. Find the total bill for each shopper.

A = [3.50 1.25 4.25 1.55 3.15];
B = [2;1;2;5;1];
C = [3;2;1;4;3];
D = A*B % Ann's shopping bill
E = A*C % Fred's shopping bill

%% 10.9 A series of experiments was performed with a bomb calorimeter. 
% In each experiment, a different amount of water was used. Calculate the 
% total heat capacity for the calorimeter for each of the experiments,
% using matrix multi-plication, the data in Table P10.9, and the information 
% on heat capacity that follows the table.

A = [110 250 10];
B = [100 250 10];
C = [101 250 10];
D = [98.6 250 10];
E = [99.4 250 10];
F = [4.2;0.45;0.90];
Exp1 = A*F
Exp2 = B*F
Exp3 = C*F
Exp4 = D*F
Exp5 = E*F

%% 10.10 The molecular weight (MW) of any compound is the sum of the 
% products of the number of atoms of each element (Z) and the atomic 
% weight (AW) of each element present in the compound. The  compositions  
% of  the  first  five  straight-chain  alcohols  are  listed  in  Table 
% P10.10. Use the atomic weights of carbon, hydrogen, and oxygen (12, 1, 
% and 16, respectively) and matrix multiplication to determine the molecular 
% weight (more correctly called the molar mass) of each alcohol.

meth = [1 4 1];
eth = [2 6 1];
prop = [3 8 1];
buta = [4 10 1];
pent = [5 12 1];
atom_wt = [12;1;16];
mw1 = meth*atom_wt
mw2 = eth*atom_wt
mw3 = prop*atom_wt
mw4 = buta*atom_wt
mw5 = pent*atom_wt

%% 10.11  Given the array,(a) Raise A to the second power by array 
% exponentiation. (Consult help if necessary.)(b) Raise A to the second power 
% by matrix exponentiation.(c) Explain why the answers are different.

% a)
A = [-1 3;4 2];
B = A.^2

% b)
A = [-1 3;4 2];
C = A^2

% c)
% They're different because of the different operations done to matrix A.
% In array exponentiation, each element is squared, while in matrix 
% exponentiation the original matrix is multiplied with itself.

%% 10.14 Recall  that  not  all  matrices  have  an  inverse.  A  matrix  
% is  singular  (i.e.,  it  doesn’t have an inverse) if its determinant 
% equals 0. Use the determinant function to test whether each 
% of the following matrices has an inverse.
% If an inverse exists, compute it.

A = [2 -1;4 5];
B = [4 2;2 1];
C = [2 0 0;1 2 2;5 -4 0];
D = det(A)
E = det(B)
F = det(C)
G = inv(A)
H = inv(C)

%% 10.18 Solve the following systems of equations, using both matrix 
% left division and the inverse matrix method.

% a)
A = [-2 1;1 1];
B = [3;10];
C = inv(A)*B
D = A\B

% b)
A = [5 3 -1;3 2 1;4 -1 3];
B = [10;4;12];
C = inv(A)*B
D = A\B

% c)
A = [3 1 1 1;1 -3 7 1;2 2 -3 4;1 1 1 1];
B = [24;12;17;0];
C = inv(A)*B
D = A\B

%% 10.19 In general, matrix left division is faster and more accurate than 
% the matrix inverse. Using both techniques, solve the following system of 
% equations and time the execution with the tic and toc functions.

A = [3 4 2 -1 1 7 1;
    2 -2 3 -4 5 2 8;
    1 2 3 1 2 4 6;
    5 10 4 3 9 -2 1;
    3 2 -2 -4 -5 -6 7;
    -2 9 1 3 -3 5 1;
    1 -2 -8 4 2 4 5];
B = [42;32;12;-5;10;18;17];
tic
C = inv(A)*B
toc
tic
D = A\B
toc

%% 10.21 Consider a separation process in which a stream of water, 
% ethanol, and meth-anol enters a process unit. Two streams leave the unit, 
% each with varying amounts of the three components (see Figure P10.21).
% Determine the mass flow rates into the system and out of the top and 
% bottom of the separation unit.

% First, set up material-balance equations for each of the three 
% components: water,ethanol,and methanol.

% Arrange the equations you found in part (a) into a matrix representation

% Use MATLAB® to solve the linear system of three equations.
A = [0 0.2 0.65;-100 0.35 0.25;100 0.45 0.1];
B = [50;0;50];
C = inv(A)*B
