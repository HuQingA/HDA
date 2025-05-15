sigma=[0.4319,0.2704,0.2473,0.1581,0.1376,0.1118];
P_union=[0.0206,0.0051,0.0035,1.02E-4,1.25E-5,1.29E-7];
P_neg=[0.0104,0.0036,0.0026,9.35E-5,1.1E-5,1E-7];
%set(0,'defaultfigurecolor','w')
semilogy(10*log10(1./sigma.^2),P_union,'-x',10*log10(1./sigma.^2),P_neg,'-*')
yticks([10^-7,10^-6,10^-5,10^-4,10^-3,10^-2,10^-1])
xlabel('ENR(dB)')
ylabel('Po')
legend('union bound','simulation')
grid on

figure
sigma=[0.4319,0.2704,0.2473,0.1581,0.1376];
theoretical_loss=[1.1098,0.2081,0.134,0.0027,3.25E-4];
loss=[0.4609,0.1457,0.0985,0.0025,2.96E-4];
plot(10*log10(1./sigma.^2),10*log10(1./theoretical_loss),'-x')
hold on;
plot(10*log10(1./sigma.^2),10*log10(1./loss),'-*')
D_Tuncel_po_the=[1.5197,0.9919,0.7520,0.4364,0.2302,0.1123,0.0406,0.0114,0.0022,2.7776e-04];
plot([8,10:18],10*log10(1./D_Tuncel_po_the),'--')
xlabel('ENR(dB)')
ylabel('SDR')
legend('theoretical','simulation','original')
grid on