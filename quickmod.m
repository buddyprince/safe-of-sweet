function y=quickmod(x,n,m)
%快速幂取模
%x:底数; n:指数; m:取模数;
x=int64(x);n=int64(n);m=int64(m);
n=dec2bin(n);%将n表示为2进制

y=1;
for k=length(n):-1:1
    if n(k)==num2str(1)
        y=mod(y.*x,m);
    end
    x=mod(x.^2,m);
end
    
    