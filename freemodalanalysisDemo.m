% Modal solution to 3-DOF problem.
% Also compared to RK integration
global m1 m2 m3 k1 k2 k3 k4 
m1=1;
m2=2;
m3=3;
k1=1;
k2=2;
k3=3;
k4=4;

x10=1;
x20=-1;
x30=0;
v10=.1;
v20=-.1;
v30=0;
X0=[x10;x20;x30];
V0=[v10;v20;v30];
tfinal = 20;

M=[m1 0 0;0 m2 0;0 0 m3];
K=[k1+k2+k4 -k2 -k4;-k2 k2+k3 -k3;-k4 -k3 k3+k4];
Mhalf=sqrt(M);
Mneghalf=inv(Mhalf);
Khat=Mneghalf*K*Mneghalf;
evals=eigs(Khat);
omega=sqrt(evals);
[P,d]=eigs(Khat);
S=Mneghalf*P;
Sinv=P'*Mhalf;
r0=Sinv*X0;
rprime0=Sinv*V0;
% return

t=0:.01:tfinal;
for j=1:size(X0,1)
for i=1:size(t,2)
r(j,i)=sqrt(omega(j)^2*r0(j)^2+rprime0(j)^2)/omega(j)*sin(omega(j)*t(i)+atan2(omega(j)*r0(j),rprime0(j)));
end
end

% Check RK simulation

options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4 1e-4 1e-4 1e-4 1e-4]);
[TL,YL] = ode45(@lin3dofdot,[0 tfinal],[x10 v10 x20 v20 x30 v30],options);

clf
subplot(3,1,1);
plot(t,r(1,:),t,r(2,:),t,r(3,:));
legend('R1' ,'R2', 'R3');

X=S*r;
subplot(3,1,2);
plot(t,X(1,:),t,X(2,:),t,X(3,:));
legend('x1' ,'x2' ,'x3');

subplot(3,1,3);
plot(TL,YL(:,1),TL,YL(:,3),TL,YL(:,5));
legend('RK x1', 'RK x2', 'RK x3');

%plot2d([-100,500],[-50,50],[-1,-1],'022')
%xset('color',5)
%
%   realtimeinit(1/10);%sets time unit to same as t vector
%   realtime(0);%sets current date to 0
%   for k=1:size(t,2)
%     realtime(k);
%     drawlater();
%     xset('color',xget('white'))
%     xfrect(-100,100,500,400);
%     xset('color',5)
%     xrect(-30,-10,2,5);
%     xrect(30*X(1,k),10,20,20);
%     for i=1:10
%      polyx(i)=-60+30*(X(1,k)+2)*i/10;
%       if modulo(i,2) == 0 then
%          polyy(i)=10;
%       else
%         polyy(i)=-10;
%       end
%   end
%   xpoly(polyx,polyy);
%  
%     xset('color',19)
%          for i=1:10
%        polyx(i)=30*X(1,k)+(30*(X(2,k)-X(1,k))+150)*i/10;
%       if modulo(i,2) == 0 then
%          polyy(i)=10;
%       else
%         polyy(i)=-10;
%       end
%   end
%   xpoly(polyx,polyy);
%     xrect(150,-10,2,5);
%     xrect(150+30*X(2,k),10,20,20);
%     drawnow();
%   end
