function private=encrypt(title,text,author)
%给文本x加密,输出为txt文件并返回解密密钥
%title:标题; text:正文; author:作者
if nargin==2
    author='';%默认电子签名为空
end
if isa(title,'char')==false
    error('标题title参数类型应为char')
end
if iscell(text)==false
    error('正文text参数类型应为cell')
end
textid=fopen(['D:\',title,'_file_SafeOfSweet.txt'],'w+');%生成存储正文文件
[public,private]=rsakey();
p=strsplit(num2str(public));
sign=['{ TIME: ',datestr(now),'; ENCRYPT-KEY: [',p{1},',**********]','; AUTHOR: ',author,' }'];%添加时间戳、作者、公钥（注：三者合为本程序数字签名）
fprintf(textid,'%s\r\n',num2str(rsaencrypt(sign,public)));
n=length(text);
for i=1:n
    textchar=rsaencrypt(text{i},public);%对正文逐行加密
    fprintf(textid,'%s\r\n',num2str(textchar));%逐行写入，换行结束
end
fclose(textid);