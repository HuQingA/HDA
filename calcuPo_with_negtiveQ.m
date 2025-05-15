function P2=calcuPo_with_negtiveQ(N,sigma,E)
%gamma1=E_1./sigma_ch.^2;
mu=-(E-0.001)/(N-1);
P2=(N-1)*qfunc(sqrt(2*(E-mu))/2/sigma);
%exp(-(zeta.^2)./2)./sqrt(2*pi)./(-zeta)+N_1.*exp(-gamma./4)./(2*sqrt(pi)*sqrt(2.*log(N_1)));

end