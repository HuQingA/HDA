n=100000;
original=normrnd(0,1,[1,n]);
%original=1;
x=original;
if original>5.5
    x=5.5;
elseif original<-5.5
    x=-5.5;
end
E_1=0.92;
E_2=1-E_1;
sigma_ch=0.1568;

load('Lmax_37levels.mat');
quantize=quantizer_37levels;
N_1=37;
N_2=1;
%quantizer_4levels变量  1行：量化电平；  2行：量化区间  3行：delta
%量化
quana=zeros(1,n);
index=zeros(1,n);
delta=zeros(1,n);
for j=1:n
for i=1:N_1
    if x(j)>=quantize(2,i) && x(j)<=quantize(2,i+1)
        quana(j)=quantize(1,i); %量化输出电平
        delta(j)=quantize(3,i);
        index(j)=i;
        break;
    end
end
end
% [ff,xixi] = ksdensity(delta);
% plot(xixi,ff,'.')

%digital coding
d_trans=zeros(n,N_1);
for i=1:n
d_trans(i,index(i))=sqrt(E_1);
end

q_error=x-quana;
un=(q_error.*delta.*sqrt(E_2)).';
%plot(1:N_2,un);

%%through channel
n_1=normrnd(0,sigma_ch,[n,N_1]);
n_2=normrnd(0,sigma_ch,[n,N_2]);

%receiver
y_dig=d_trans+n_1;
y_ana=un+n_2;

%digital decoder
re_index=zeros(n,1);
for i=1:n
    re_index(i)=find(y_dig(i,:)==max(y_dig(i,:))).';
end
dig_hat=quantize(1,re_index);
%re_delta=quantize(2,2);
k=1;
for i=1:n
    if index(i)==re_index(i)
        re_delta(k)=quantize(3,re_index(i));
        k=k+1;
    end
end


% %analog decoder
% u_hat=y_ana;
% 
% ana_hat=u_hat./sqrt(E_2)./re_delta;
% recover=ana_hat+dig_hat;
[f,xi] = ksdensity(re_delta);
plot(xi,f,'+')