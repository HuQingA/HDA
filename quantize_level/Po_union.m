N=80;
sigma=1/sqrt(log(N/1.2794)*12);
a=-1/(N-0.999);
d1=sqrt(2*(1-a));
d2=sqrt(2);
d1/2/sigma
qfunc(d1/2/sigma)
Po_neg=N*qfunc(d1/2/sigma)
Po_ortho=N*qfunc(d2/2/sigma)