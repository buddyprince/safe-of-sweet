function [y,msg]=login(account,password)
%判断用户名密码是否正确
private=int64([1312018289,1000161563]);
id=fopen(['D:\',account,'_account_SafeOfSweet.txt']);
if id<1||isempty(account)
    y=false;
    msg='用户名不存在';
    return;
else
    file=textscan(id,'%s');
    n=length(file{1});
    for i=1:n
        a(i)=str2int64(file{1}{i});
    end
    if rsadecrypt(a,private)~=false 
        if isequal(password,rsadecrypt(a,private))==true
            y=true;
            msg="";
        else
            y=false;
            msg='密码不正确';
        end
    else
        y=false;
        msg='密码不正确';
    end
end
fclose(id);      