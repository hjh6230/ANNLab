x = (-5:1:5)';
y = x;
z = exp(-x .* x * 0.1) * exp(-y .* y * 0.1)' - 0.5;
[gridsize, xsize] = size(x);
disp(gridsize);
disp(size(z));

mesh(x, y, z);

targets = reshape(z, 1, gridsize*gridsize);
[xx, yy] = meshgrid(x, y);
patterns = [reshape(xx, 1, gridsize*gridsize); reshape(yy, 1, gridsize*gridsize)];

permute = randperm(gridsize*gridsize);
patterns = patterns(:,permute);
targets = targets(:,permute);

%first n patterns and targets
n = 25;
patterns = patterns(:, 1:n);
targets = targets(:, 1:n);
