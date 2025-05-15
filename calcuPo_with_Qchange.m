function [P2,P3,Plow,Papprox]=calcuPo_with_Qchange(N,sigma_ch,E_1)
gamma1=E_1./sigma_ch.^2;
gamma0=1./sigma_ch.^2;

%Tuncel
u1=sqrt(2.*log(N))-sqrt(gamma1);
P1=qfunc(-u1)+N./(2*1.414).*exp(-gamma1/4).*qfunc(sqrt(2).*(sqrt(gamma1/4)+u1));

%our
t=sqrt(1/36+8/3./N)-1/6;
t3=sqrt(8/3./(N+1));
tlow=3./(N+1);

u2=sqrt(-2.*log(abs(t)))-sqrt(gamma1);
u3=sqrt(-2.*log(abs(t3)))-sqrt(gamma1);
ulow=sqrt(-2.*log(abs(tlow)))-sqrt(gamma1);

P2=qfunc(-u2)+3/8*N.*exp(-gamma1./3).*qfunc(1.732*(u2+2/3.*sqrt(gamma1)))/1.732+1/8*N.*exp(-gamma1./4).*qfunc(sqrt(2)*(u2+sqrt(gamma1./4)))/1.414;
P3=qfunc(-u3)+3/8*N.*exp(-gamma1./3).*qfunc(1.732*(u3+2/3.*sqrt(gamma1)))/1.732+1/8*N.*exp(-gamma1./4).*qfunc(sqrt(2)*(u3+sqrt(gamma1./4)))/1.414;
Plow=qfunc(-ulow)+3/8*N.*exp(-gamma1./3).*qfunc(1.732*(ulow+2/3.*sqrt(gamma1)))/1.732+1/8*N.*exp(-gamma1./4).*qfunc(sqrt(2)*(ulow+sqrt(gamma1./4)))/1.414;
Papprox=Q_approx(-u3)+sqrt(3)/8*N.*exp(-gamma1./3).*Q_approx(sqrt(3)*(u3+2/3.*sqrt(gamma1)))+sqrt(2)/16*N.*exp(-gamma1./4).*Q_approx(sqrt(2)*(u3+sqrt(gamma1)./2));
%plot(N,P1,N,P2)
Porig=0.8536*(1.2794*exp(gamma0/12)-1).*exp(-gamma1./4);
end