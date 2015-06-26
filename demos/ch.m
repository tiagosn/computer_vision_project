addpath ..

P = 8;
R = 1;

im = im2double(imread('/home/tiagosn/datasets/cv_project/ds1/T13_wall/T13_01.jpg'));
im_norm = (im - mean(im(:)))/std(im(:));
[f1, f2] = lcr(im_norm, P, R);

CH1 = fftshift(fft2(abs(f1)));
CH2 = fftshift(fft2(abs(f2)));  

figure('Name', 'Spectrum - log(abs(CH1)) ')
imshow(log(abs(CH1)), [])

aux = log(abs(CH1));
aux = (aux - min(aux(:)))/(max(aux(:)) - min(aux(:)));
imwrite(aux, '/home/tiagosn/Copy/PhD/classes/computer_vision/project/images/pipeline/spec1.png')

figure('Name', 'Spectrum - log(abs(CH2)) ')
imshow(log(abs(CH2)), [])

aux = log(abs(CH2));
aux = (aux - min(aux(:)))/(max(aux(:)) - min(aux(:)));
imwrite(aux, '/home/tiagosn/Copy/PhD/classes/computer_vision/project/images/pipeline/spec2.png')

r1 = 140;
r2 = 170;

rows = size(f1, 1);
cols = size(f1, 2);

D = zeros(size(f1));
for i = 1:rows
    for j = 1:cols
        x = (i-rows/2);
        y = (j-cols/2);
        d = sqrt(x^2 + y^2);

        if(d >= r1 && d <= r2)
            D(i,j) = 1;;
        end
    end
end

figure('Name', 'Band-pass filter')
imshow(D)


