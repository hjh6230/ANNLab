Loop=20;
eta=0.001;
[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

W=randn(outsize,insize+1);


axis ([-2, 2, -2, 2], 'square');


while (Loop>0)
    
    
    dw=-eta*(W*X-targets)*X';
    W=W+dw;
    Loop=Loop-1;
    
    p = W(1,1:2);
k = -W(1, insize+1) / (p*p');
l = sqrt(p*p');
plot (patterns(1, find(targets>0)), ...
patterns(2, find(targets>0)), '*', ...
patterns(1, find(targets<0)), ...
patterns(2, find(targets<0)), '+', ...
[p(1), p(1)]*k + [-p(2), p(2)]/l, ...
[p(2), p(2)]*k + [p(1), -p(1)]/l, '-');
drawnow;
pause(0.2);


end