%distortion for N2=1 S
function total_loss=distortion_when_N_2_equal_1(E_1,sigma,N_1,q)
% E_1=0.954;
E_2=1-E_1;

quantize=q;
gamma=quantize(3,:).*sqrt(E_2);

N_2=1;
%数字部分
summ_dig=zeros(1,N_1);
for i=1:N_1
    for j=1:N_1
        if j~=i
            temp=(quantize(1,i)-quantize(1,j))^2;
            summ_dig(1,i)=summ_dig(1,i)+temp;
        else
            continue;
        end
    end
    summ_dig(1,i)=summ_dig(1,i)*quantize(4,i);
end
dig_loss=sum(summ_dig,2)/(N_1-1)

t2=0;
for i=1:N_1
    t2=t2+quantize(1,i)^2*quantize(4,i);
end
ana_Oc_loss=(1-t2)*sigma^2/E_2

ana_O_loss=0;
for i=1:N_1
    for j=1:N_1
        if j~=i
            temp=E_2*(gamma(j)-gamma(i))^2/(gamma(i)*gamma(j))^2+sigma^2/gamma(j)^2;
            ana_O_loss=ana_O_loss+temp*quantize(4,i)/(N_1-1);
        end
    end
end
ana_O_loss

Po=calcuPo_with_Qchange(N_1,sigma,E_1);
(dig_loss+ana_O_loss)*Po;
(1-Po)*ana_Oc_loss;
total_loss=(dig_loss+ana_O_loss)*Po+(1-Po)*(1-Po)*ana_Oc_loss;
end
