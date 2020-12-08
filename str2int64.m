function y=str2int64(x)
%将char转为int64
if isa(x,'char')==false
    error('输入x数据类型应为char');
end
if isempty(x)
    y=false;
    return;
end
n=length(x);
y=int64(0);
for i=n:-1:2
    if x(i)==' '||isnan(str2double(x(i)))
        y=false;
        return;
    else
        y=y+int64(str2double(x(i)))*int64(10^(n-i));
    end
end
if x(1)=='-'
    y=-y;
else
    y=y+int64(str2double(x(1)))*int64(10^(n-1));
end
end