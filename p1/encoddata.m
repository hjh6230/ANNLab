clear
patterns=-ones(8,8);
for i=1:1:8
    patterns(i,i)=1;
end

targets=patterns;

X=[patterns;ones(1,8)];