//TO SOLVE GIVEN ODE 2ND ORDER BOUNDARY VALUE PROBLEM AND PLOT THE RESULTS
/* Given Boundary Value Problem
     y'' = p(x)y'+q(x)y+r(x)
     y(a)=ya
     y(b)=yb

 */
///BY VISHU SAINI

clc()
clear

//1. DEFINE BVP
//a.ode
function [p,q,r]=ode(x)
    p=1
    q=0                      //Defining the coeffecients of ode
    r=30*(x*x*x*x) - 20*(x*x*x) + 12*(x*x) -4*x
endfunction
//b. boundary conditions
a=0
b=2
ya=0
yb=40

//2.DISCRETIZE SPACE
N= input("enter number of values")
h=(b-a)/(N-1)              //step-size

//a.initialize  
for i=1:N
    X(i)=0
end


//b.store nodal points as an array
for i=1:N
    X(i)= a + (i-1)*h
end

disp(X)


//3.FDM APPROXIMATION
////for i=1:N
//
//    ys=(Y(i+1,1)+Y(i-1,1) -2*Y(i,1))/(h*h)
//    yf=(Y(i+1,1)-Y(i-1,1))/2*h
//    
//    y=Y(i,1)
//    x=X(i,1)
//
//end




//4.MATRIX FORMULATION
//a. constants of the matrix

for i=1:N
    [p,q,r]=ode(X(i,1))
    A(i,1)= 2+(h*p)
    B(i,1)= -4-2*q*h*h
    C(i,1)= 2-h*p
    D(i,1)= 2*h*h*r
        
end


//disp(A)
//disp(B)
//disp(C)
//disp(D)

//b. The Matrix
//initialize n x n zero matrix
for i=1:N
    for j = 1:N
    H(i,j)=0
    end
end


for i=2:N-1 
      
     H(i,i)=B(i,1)
     H(i,i-1)=A(i,1)
     H(i,i+1)=C(i,1)
   
end



H(1,1)=1
H(N,N)=1

//c.coefficient matrix
for i=1:N
    J(i,1)= D(i,1)
end

J(1,1)=ya
J(N,1)=yb

disp(J)
disp(H)

//5.SOLVE THE N LINEAR EQAUTIONS


S=inv(H)*J


//6.PLOT THE RESULTS
//a.plot solution 

plot(X,S)
xlabel("x","fontsize",3,"color","red")                //x and y label
ylabel("y(x)","fontsize",3,"color","red")
gca().grid=[1 1 1]    //turn on grid




