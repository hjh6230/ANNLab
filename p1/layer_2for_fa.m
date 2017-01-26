alpha=0.9;
hidesize=20;
eta=0.001;
[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

w=randn(hidesize,insize+1);
v=randn(outsize,hidesize+1);

Loop=1000;

epoch=1;

dw=0;
dv=0;

while (Loop>=epoch)
    

    hin = w * [patterns ; ones(1,ndata)];
    hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,ndata)];
    oin = v * hout;
    out = 2 ./ (1+exp(-oin)) - 1;


    delta_o = (out - targets) .* ((1 + out) .* (1 - out)) * 0.5;
    delta_h = (v' * delta_o) .* ((1 + hout) .* (1 - hout)) * 0.5;
    delta_h = delta_h(1:hidesize, :);


    dw = (dw .* alpha) - (delta_h * X') .* (1-alpha);
    dv = (dv .* alpha) - (delta_o * hout') .* (1-alpha);
    w = w + dw .* eta;
    v = v + dv .* eta;
    
    error(epoch) = sum(sum(abs(sign(out) - targets)./2));
    epoch=epoch+1;
    
    gridsize=11;
    zz = reshape(out, gridsize, gridsize);
    mesh(x,y,zz);
    axis([-5 5 -5 5 -0.7 0.7]);
    drawnow;
%     pause(0.001);

    
end


