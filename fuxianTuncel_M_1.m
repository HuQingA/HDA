%复现Eencel文章中的方法
u_source=0;
sigma_source=1;
u_ch=0;
sigma_ch=0.1413;
%10dB-20dB :0.3162    0.2512    0.1995    0.1585    0.1259    0.1000
E=1;
SNR=E/(sigma_ch^2);
N=106;%ceil(1.2794*exp(1/12*SNR));
%N=360;
delta=1/N;
summ=0;
out=0;


num=10000000;
%生成量化区间[0,1]
m=zeros(1,N);
for i=1:N+1
    m(i)=0+(i-1)*delta;
end

for j=1:num
x=normrnd(u_source,sigma_source);
G=normcdf(x,0,1.554);

%%进行量化
for i=1:N
    if G>=m(i) && G<=m(i+1)
        %t=(m(i)+m(i+1))/2;%T
        index=i;
        break;
    end
end

% plot(x,t,'.');
% hold on;
%plot(x,G,'+');
%%generate 正交
d=zeros(1,N);
d(index)=sqrt(E);
n_1=normrnd(u_ch,sigma_ch,[1,N]);
y_dig=d+n_1;

%digital decoder
re_index=find(y_dig==max(max(y_dig)));
% as=zeros(1,N);
% for kk=1:N
%     temp=zeros(1,N);
%     temp(kk)=sqrt(E);
%     as(kk)=sum(temp.*y_dig);
% end
% [eqeq,re_index]=max(as);

% re_dig=delta*(re_index(1)-0.5);
% y = icdf('Normal',re_dig,0,1.554);
% summ=summ+(y-x)^2;
if re_index~=index
    out=out+1;
end
end
loss=summ/num;
out/num