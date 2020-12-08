function [x,y]=exeuclid(a,b)
%扩展欧几里得方法
%求解二元一次不定方程ax+by=gcd(a,b),解不唯一
a=int64(a);b=int64(b);
if b==0
    x=int64(1);
    y=int64(1);%解不唯一由此处b=0时y的取值可以为任意导致，此处取y=1
else
    [x1,y1]=exeuclid(b,mod(a,b));
    x=y1;
    y=x1-idivide(a,b,'floor')*y1;
end