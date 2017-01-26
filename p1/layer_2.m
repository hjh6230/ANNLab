alpha=0.9;
hidesize=3;
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

    
end


plot(1:1:Loop,error)

% [xa,xb]=meshgrid(-3:0.02:3,-3:0.02:3);
% gsize=size(xa,1);
% in1=reshape(xa,1,gsize^2);
% in2=reshape(xb,1,gsize^2);
% input=[in1;in2];
% hin = w * [input ; ones(1,gsize^2)];
%     hout = [2 ./ (1+exp(-hin)) - 1 ; ones(1,gsize^2)];
%     oin = v * hout;
%     output = 2 ./ (1+exp(-oin)) - 1;
% output=reshape(output,gsize,gsize);
% 
% hold on
% 
% 
% for i=1:1:gsize
%     for j=1:1:gsize
%         if (output(i,j)>0) 
%             plot(xa(i,j),xb(i,j),'*g');
%         end
%     end
% end
% 
% 
% for i=1:1:ndata
%     if(targets(i)==1)
%         plot(patterns(1,i),patterns(2,i),'ro');
%     else
%         plot(patterns(1,i),patterns(2,i),'kx');
%     end
%         
% end

