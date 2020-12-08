function []=register(account,password)
%注册用户名与密码，并且对输入的密码进行加密
public=int64([1312018289,32519]);%RSA公钥

id=fopen(['D:\',account,'_account_SafeOfSweet.txt'],'w+');%生成存储文件
password=rsaencrypt(password,public);%对密码加密
fprintf(id,'%s',num2str(password));
fclose(id);