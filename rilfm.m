function features = rilfm(f1, f2, r1, r2)
%RILFM Summary of this function goes here
%   Detailed explanation goes here
    rows = size(f1, 1);
    cols = size(f1, 2);
    
    %rows_idx = repmat((1:rows)', [1, cols]);
    %cols_idx = repmat(1:cols, [rows, 1]);
    %
    %CH1 = zeros(size(f1));
    %CH2 = zeros(size(f1));
    %
    %for k = 1:rows
    %    for l = 1:cols
    %        fprintf('k = %d, l = %d\n', k, l);
    %        aux1 = f1.*exp(-2*pi*1i*(rows_idx*(k-rows/2)/rows + cols_idx*(l-cols/2)/cols));
    %        aux2 = abs(f2).*exp(-2*pi*1i*(rows_idx*(k-rows/2)/rows + cols_idx*(l-cols/2)/cols));
    %        
    %        CH1(k,l) = sum(aux1(:));
    %        CH2(k,l) = sum(aux2(:));
    %    end
    %end
    
    CH1 = fftshift(fft2(f1));
    CH2 = fftshift(fft2(f2));
        
    D = zeros(size(f1));
    
    total = 0;
    for i = 1:rows
        for j = 1:cols
            x = (i-rows/2);
            y = (j-cols/2);
            d = sqrt(x^2 + y^2);
            
            if(d >= r1 && d <= r2)
                D(i,j) = 1;
                total = total + 1;
            end
        end
    end
    
    aux1 = abs(CH1).*D;
    aux2 = abs(CH2).*D;
    
    features = [0, 0];
    features(1) = sum(aux1(:))/total;
    features(2) = sum(aux2(:))/total;
end

