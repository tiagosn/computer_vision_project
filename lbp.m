% baseado no codigo de: http://www.bytefish.de/blog/local_binary_patterns/

function out = lbp(src, P, R)
    U = zeros(size(src), 'uint8');
    out = zeros(size(src), 'uint8');
    
    rows = size(src, 1);
    cols = size(src, 2);
    
    for p = 1:P
        x = -R*sin(2*pi*p/P);
        y = R*cos(2*pi*p/P);
        
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
        
        for i = (R+1):(rows-(R+1))
            for j = (R+1):(cols-(R+1))
                aux = w1*src(i+fx,j+fy) + w2*src(i+cx,j+fy) + w3*src(i+fx,j+cy) + w4*src(i+cx,j+cy);
                if(aux >= src(i,j))
                    out(i,j) = out(i,j) + 2^(p-1);
                end
            end
        end
    end
    
    % TODO:
    %   - fazer shifts para calcular a uniformidade de out
    %   - colocar os valores dos pontos uniformes e não uniformes em out
    %   - calcular o histograma 
end