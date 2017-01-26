[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

disp(ndata);

%in data compression, hidden = 3 & final = 8
hidden = 100;  %number of nodes in the hidden layer
final = 1;   %number of nodes in the final layer

W = randn(hidden, insize+1);
V = randn(final, hidden+1);

dW = zeros(hidden, insize+1);
dV = zeros(final, hidden+1);

alpha = 0.9;
eta = 0.001;
epoch = 5000;

error = zeros(1, epoch);

X = [patterns; ones(1, ndata)];

for i=1:epoch
    %forward pass
    hin = W * X;
    hout = [2 ./ (1+exp(-hin)) - 1; ones(1,ndata)];

    oin = V * hout;
    out = 2 ./ (1+exp(-oin)) - 1;

    %backward pass
    delta_o = (out - targets) .* ((1 + out) .* (1 - out)) * 0.5;
    delta_h = (V' * delta_o) .* ((1 + hout) .* (1 - hout)) * 0.5;
    delta_h = delta_h(1:hidden, :);

    %momentum
    dW = (dW .* alpha) - (delta_h * X') .* (1 - alpha);
    dV = (dV .* alpha) - (delta_o * hout') .* (1 - alpha);

    %update weights
    W = W + dW .* eta;
    V = V + dV .* eta;
    
    %sum up number of misclassified datapoints for each epoch
    error(i) = sum(sum(abs(sign(out) - targets) ./2));
    
    %draw
    %zz = reshape(out, gridsize, gridsize);  %for all patterns
    %mesh(x, y, zz);          %for all patterns
    xaxis = patterns(1,:);  %for first n patterns
    yaxis = patterns(2,:);
    tri = delaunay(xaxis, yaxis);
    trimesh(tri, xaxis, yaxis, out);  %for first n patterns
    axis([-5 5 -5 5 -0.7 0.7]);
    drawnow;
end

disp(error(epoch));
disp(sign(W));

