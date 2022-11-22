clear
x=[-10,0,10,20,30];
y=[0.99815,0.99987,0.99973,0.99823,0.99567];
h=10;
B =(6/(h^2))*[(y(1)-(2*y(2))+y(3));(y(2)-(2*y(3))+y(4));(y(3)-(2*y(4))+y(5))];

%A=[[5 1 0];[1 4 1];[0 1 4]]; % Parabolic Runout Spline
%A=[[4 1 0];[1 4 1];[0 1 4]]; % Natural spline
A=[[6 0 0];[1 4 1];[0 1 4]]; % Cubic Run out spline

Mtemp =inv(A)*B;

%vector of M1-M5

%M=[Mtemp(1);Mtemp(1);Mtemp(2);Mtemp(3);Mtemp(3)] %Parabolic Runout Spline M1=M2, M5=M4
%M=[0;Mtemp(1);Mtemp(2);Mtemp(3);0] % Natural Spline:  M1=0; m5=0
M=[(2*Mtemp(1))-Mtemp(2);Mtemp(1);Mtemp(2);Mtemp(3);(2*Mtemp(3))-Mtemp(2)] % Cubic runout spline M1 = 2M2-M3;M5=2M4-M3

%Construct a2,b2,c2, and d2 as follows- hint: 2nd spline max the pressure
a2=(M(3)-M(2))/(6*h);
b2=M(2)/2;
c2=((y(3)-y(2))/h) - ((( (2*M(2)) + M(3))/6)*h);
d2=y(2);

% vector of polynomial coefficients
coef= [a2,b2,c2,d2]

% generate high freq data
xx = 0:0.1:10;
yy=polyval(coef,xx);
plot(x,y,'o',xx,yy)
grid on;
[row, col] = find(ismember(yy, max(yy(:))));
fprintf("Maximum Density was reached at temperature: %d and density: %g\n",xx(col),yy(col));
