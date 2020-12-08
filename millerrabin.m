function y=millerrabin(p)
%Miller Rabin素数测试
p=int64(p);
if mod(p,2)==0||p==1 %排除1和偶数
    y=false;
    return
end

%将p-1表示为d*2^r
r=int64(0);
while(1)
    if mod(p-1,2^r)==0 
        r=r+1; 
    else
        r=r-1;
        break;
    end
end
d=int64((p-1)/2^r);
%将p-1表示为d*2^r end

a=int64([2,3,5,7,11,13,17,61,24251]);
%确保a<p
for n=1:length(a)
    if a(n)>p
        break;
    end
end
n=n-1;
%确保a<p end

for j=1:n
    %首先保证满足费马小定理，否则一定为合数
    %若p为素数且(a,p)=1，则a^(p-1)=1 mod p
    if int64(quickmod(a(j),d*2^r,p))~=int64(1)
        y=false;
        return 
    end
    %首先保证满足费马小定理，否则一定为合数end
    
    for s=r-1:-1:0
        %然后保证a^(d*2^s)<p
        if int64(a(j)^(d*2^s))>=p
            break;
        end
        %然后保证a^(d*2^s)<p end
        
        %最后进行二次探测
        %设p为素数, 若x<p，有x^2 =1 mod p，则x=1或x=p-1(此处最开始的x^2 =1 mod p由费马小定理保证)
        if int64(quickmod(a(j),d*2^s,p))==int64(1)%x=1时继续
            continue;
        elseif int64(quickmod(a(j),d*2^s,p))==int64(p-1)%x=p-1时停止
            break;
        else%否则p一定是合数
            y=false;
            return;
        end
        %最后进行二次探测end
    end
end
y=true;