i=zeros(1,36);
f=zeros(1,36);
i(1)=0;
for v = 1:1:35
  i(v+1)=sin(v*10*pi/180);
 
end

for v = 1:1:36
 
  f(v)=fi(i(v),1,8,6);
end



