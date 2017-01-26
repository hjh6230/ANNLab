alpha=0.9;
hidesize=3;
eta=0.001;
[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);

w=randn(hidesize,insize);
v=randn(outsize,hidesize);

Loop=10000;

epoch=1;

dw=0;
dv=0;

stop=0;

while (stop~=1)
    

    hin = w * patterns;
    hout = 2 ./ (1+exp(-hin)) - 1;
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
    if(error(epoch)==0) 
        stop=1;
    end
    
    epoch=epoch+1;

    
    
end


