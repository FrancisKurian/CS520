% Using different methods for Least Squares Method

 % data points 
 x=[1 2 3 4 5];
 y=[3 1 4 8 12];
 
 % method 1 
 p=polyfit(x,y,2)
 
 % method 2
 A=[(x.^2)' x' ones(5,1)];
 Coeff1= inv(A'*A)*(A'*y')
 
 % method 3
 B=[sum(x.^4) sum(x.^3) sum(x.^2);sum(x.^3) sum(x.^2) sum(x);sum(x.^2) sum(x) 5];
 z=[sum(x.^2.*y) sum(x.*y) sum(y)];
 Coeff2=inv(B)*z'
 
 xx=[1:.01:5];
 yy=polyval(p,xx);
 
 plot(x,y,'o',xx,yy,'r')

