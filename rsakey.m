function [public,private]=rsakey()
%生成RSA公钥与密钥
%x:密钥发生器种子

%随机生成2个素数p、q
p=1;
a=int64(2^16);
while(millerrabin(p)==false)
    p=int64(a*rand('double'));
end
q=1;
while(millerrabin(q)==false)
    q=int64(a*rand('double'));
end
%随机生成2个素数p、q end

n=p*q;
L=(p-1)*(q-1);%即L=φ(n)

d=0;
while(d<=0)
    %随机生成1个[2^14,2^15]间与L互质的数e
    e=0;
    while(gcd(e,L)~=1)
        e=int64(2^14+(2^15-2^14)*rand('double'));
    end
    %随机生成1个[2^14,2^15]间与L互质的数e

    %生成e的关于L(=φ(n))的的模反元素d，且d>0,若不成立，则重新生成e后计算
    %ed ≡ 1 (mod φ(n))，即ed - 1 = kφ(n)，即ex + φ(n)y = 1,用扩展欧几里得方法求解x,y后保留x，解不唯一
    d=exeuclid(e,L);
    %生成e的关于L(=φ(n))的模反元素d end
end

public=[n,e];
private=[n,d];