clear;
clc;
x='你好，很高兴见到你，很高兴与你见面';
%[public,private]=rsakey();
public=int64([1934502953, 18385]);
private=int64([1934502953, 1152966505]);
a=abs(x)
quickmod(a,public(2),public(1))
y=rsaencrypt(x,public)
z=rsadecrypt(y,private)
