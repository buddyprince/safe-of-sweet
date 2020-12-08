function [text,msg]=decrypt(title,private)
%给名为title的txt文件用密钥private解密,输出为明文
if isa(title,'char')==false
    error('标题数据类型应为char');
end

id=fopen(['D:\',title,'_file_SafeOfSweet.txt']);
if id<1
    text=false;
    msg='文件不存在';
    return;
else
    i=0;
    line=0;
    while(1)
        line=fgetl(id);%逐行读取
        if line==-1%判断是否已经读完最后一行
            break;
        end
        file=strsplit(line);%分割为字符串cell
        i=i+1;
        for j=1:length(file)
            a(i,j)=str2int64(file{j});
        end
    end
    text=rsadecrypt(a,private);
    if text==false
        msg='密钥格式非法';
        return;
    else
        msg='';
    end
end
fclose(id);      