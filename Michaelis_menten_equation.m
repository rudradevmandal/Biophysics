x = 0;
c = [];
i=1;
dt = 10^(-4);
dx = 10^(-3);
prompt = 'Enter the maximum time:'
tmax = input(prompt);

for j=0:1:1000
for t=0:dt:tmax
    dv = (H(x+dx)-H(x))/dx;
    x = x - dt*dv + sqrt(2*dt)*randn;
    if(x>10)
        break;
    elseif(x<0)
            x = -x;            
    end
    c(i) = x;
    i = i+1;   
end
end

a = [histcounts(c,0:dx:10) 0];
b = a/sum(a);
figure
subplot(2,1,1)
bar(0:dx:10,a)

subplot(2,1,2)
plot(0:dx:10,b)