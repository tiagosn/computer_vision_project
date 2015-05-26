% baseado no codigo de: http://www.bytefish.de/blog/local_binary_patterns/

function out = lbp(src, P, R)
    u = zeros(size(src));
    %out = zeros(size(src), 'uint8');
    out = zeros(size(src));
    code = zeros(size(src));
    
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
                    code(i,j) = code(i,j) + 2^(p-1);
                    out(i,j) = out(i,j) + 1;
                end
            end
        end
    end
    
    p1 = bitget(out, P);
    p2 = bitget(out, 1);
    u = u + xor(p1, p2);
    for p = 1:P
        p1 = p2;
        p2 = bitget(out, p);
        u = u + xor(p1, p2);
    end
    
    out(u>2) = P+1;
    
    % TODO:
    %   - calcular o histograma 
end