%global classA;
%global classB;
%global patterns;
%global targets;

classA(1,:) = [randn(1,50) .* 0.2 - 1.0, ...
               randn(1,50) .* 0.2 + 1.0];
classA(2,:) = randn(1,100) .* 0.2 + 0.3;
classB(1,:) = randn(1,100) .* 0.3 + 0.0;
classB(2,:) = randn(1,100) .* 0.3 - 0.1;

targets = eye(8)*2 - 1;
p = zeros(2, 64);

for i=1:64
    if mod(i,9)==1
       p(:,i) = classA(:,i); 
    else
        p(:,i) = classB(:,i);
    end
end

patterns = reshape(p, 16, 8);

%disp(patterns);
