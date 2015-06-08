function [f1, f2] = lcr(src, P, R)
%LCR Summary of this function goes here
%   Detailed explanation goes here

    rows = size(src, 1);
    cols = size(src, 2);
    
    f1 = zeros(rows-2*R-1, cols-2*R-1);
    f2 = zeros(rows-2*R-1, cols-2*R-1);

    ns = zeros(1, P);

    for i = (R+1):(rows-(R+1))
        for j = (R+1):(cols-(R+1))
            for p = 1:P
                x = -R*sin(2*pi*(p-1)/P);
                y = R*cos(2*pi*(p-1)/P);
                
                fx = floor(x);
                fy = floor(y);
                cx = ceil(x);
                cy = ceil(y);

                dx = x - fx;
                dy = y - fy;
                
                w1 = (1 - dx) * (1 - dy);
                w2 =      dx  * (1 - dy);
                w3 = (1 - dx) *      dy;
                w4 =      dx  *      dy;
                
                ns(p) = w1*src(i+fx,j+fy) + w2*src(i+cx,j+fy) + w3*src(i+fx,j+cy) + w4*src(i+cx,j+cy);
            end
            
            fall = fft(ns);
            
            f1(i-R,j-R) = fall(1);
            f2(i-R,j-R) = fall(2);
        end
    end
end

