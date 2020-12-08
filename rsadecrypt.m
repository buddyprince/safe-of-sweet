function x=rsadecrypt(y,key)
%RSA解密算法
%y:密文; x:明文; key:解密密钥
if isa(y,'numeric')==false
    x=false;
    error('密文y数据类型应为numeric');
elseif max(y)>=key(1)
    x=false;
    warning('解密密钥key的n值过小,解密终止');
    return;
elseif size(key)~=size([1,1])
    x=false;
    warning('解密密钥key数据类型应为1*2数组，解密终止')
    return;
end
x=char(quickmod(y,key(2),key(1)));
