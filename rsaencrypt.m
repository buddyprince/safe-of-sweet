function y=rsaencrypt(x,key)
%RSA加密算法
%x:明文; y:密文; key:加密密钥
if max(abs(x))>=key(1)
    y=false;
    error('加密密钥key的n值过小');
elseif isa(x,'char')==false
    y=false;
    error('明文x数据类型应为char');
elseif size(key)~=size([1,1])
    error('加密密钥key数据类型应为1*2数组')
end
y=quickmod(abs(x),key(2),key(1));