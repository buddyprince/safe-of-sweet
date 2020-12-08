function y=rounddown(x)
%向下取整
y=0;
while(1)
    if x>=y&&x<y+1
        break;
    else
        y=y+1;
    end
end