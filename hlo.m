function hlo_std = hlo(f2i, f2j, d)
%HLO Summary of this function goes here
%   Detailed explanation goes here
    phd = angle(f2i) - angle(f2j);
    
    rows = size(f2i, 1);
    cols = size(f2i, 2);
    
    oriBinIdx = zeros(rows, cols, 2);
    oriBinIdx(:,:,1) = floor(d*phd/(2*pi));
    oriBinIdx(:,:,2) = ceil(d*phd/(2*pi));
    
    oriBinVal = zeros(rows, cols, 2);
    oriBinVal(:,:,1) = (2*pi/d - abs(2*pi*(oriBinIdx(:,:,1)-1)/d - phd))/(2*pi/d);
    oriBinVal(:,:,2) = (2*pi/d - abs(2*pi*(oriBinIdx(:,:,2)-1)/d - phd))/(2*pi/d);
    
    hlo = zeros(rows, cols, d);
    
    for i = 1:rows
        for j = 1:cols
            for a = [i-1 i i+1]
                for b = [j-1 j j+1]
                    idx = oriBinIdx(a,b,1);
                    hlo(a,b,idx) = hlo(a,b,idx) + oriBinVal(a,b,1);
                    if(idx ~= oriBinIdx(a,b,2))
                        idx = oriBinIdx(a,b,2);
                        hlo(a,b,idx) = hlo(a,b,idx) + oriBinVal(a,b,2);
                    end
                end
            end
        end
    end
    
    hlo_std = zeros(1,d);
    for i = 1:d
        aux = hlo(:,:,i);
        hlo_std(i) = std(aux(:));
    end
end

