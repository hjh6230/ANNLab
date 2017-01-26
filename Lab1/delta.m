W = randn(1, 3);
disp(W);
X(1,:) = ones(1, length(patterns));
X(2,:) = patterns(1,:);
X(3,:) = patterns(2,:);
%disp(X);

T = targets;

[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

eta = 0.001;
for epoch=1:500
    deltaW = -eta * (W*X - T) * X.';
    W = W + deltaW;
    
    %draw
    p = W(1, 2:3);
    k = -W(1, insize+1) / (p*p');
    l = sqrt(p*p');
    plot(patterns(1, find(targets>0)), ...
         patterns(2, find(targets>0)), '*', ...
         patterns(1, find(targets<0)), ...
         patterns(2, find(targets<0)), '+', ...
         [p(1), p(1)]*k + [-p(2), p(2)]/l, ...
         [p(2), p(2)]*k + [p(1), -p(1)]/l, '-');
    drawnow;
end
disp(W);

%{
p = W(1, 1:2);
k = -W(1, insize+1) / (p*p');
l = sqrt(p*p');
plot(patterns(1, find(targets>0)), ...
     patterns(2, find(targets>0)), '*', ...
     patterns(1, find(targets<0)), ...
     patterns(2, find(targets<0)), '+', ...
     [p(1), p(1)]*k + [-p(2), p(2)]/l, ...
     [p(2), p(2)]*k + [p(1), -p(1)]/l, '-');
 drawnow;
 %}