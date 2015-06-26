folder = '/home/tiagosn/datasets/cv_project/ds1/T01_bark1/';
files = dir(strcat(folder, '*.jpg'));

descs = [];

P = 8;
R = 1;

r1 = 110;
r2 = 130;

for i = 1:length(files)
    fprintf('Processing image %s... ', files(i).name);
    imPath = strcat(folder, files(i).name);
    
    im = im2double(imread(imPath));
    im = (im - mean(im(:)))/std(im(:));
    
    [f1, f2] = lcr(im, P, R);
    features = rilfm(f1, f2, r1, r2);
    
    descs = [descs; [features, 1]];
    fprintf('Done!!!\n');
end

folder = '/home/tiagosn/datasets/cv_project/ds1/T15_brick2/';
files = dir(strcat(folder, '*.jpg'));

descs2 = [];

for i = 1:length(files)
    fprintf('Processing image %s... ', files(i).name);
    imPath = strcat(folder, files(i).name);
    
    im = im2double(imread(imPath));
    im = (im - mean(im(:)))/std(im(:));
    
    [f1, f2] = lcr(im, P, R);
    features = rilfm(f1, f2, r1, r2);
    
    descs2 = [descs2; [features, 2]];
    fprintf('Done!!!\n');
end

folder = '/home/tiagosn/datasets/cv_project/ds1/T20_upholstery/';
files = dir(strcat(folder, '*.jpg'));

descs3 = [];

for i = 1:length(files)
    fprintf('Processing image %s... ', files(i).name);
    imPath = strcat(folder, files(i).name);
    
    im = im2double(imread(imPath));
    im = (im - mean(im(:)))/std(im(:));
    
    [f1, f2] = lcr(im, P, R);
    features = rilfm(f1, f2, r1, r2);
    
    descs3 = [descs3; [features, 3]];
    fprintf('Done!!!\n');
end

folder = '/home/tiagosn/datasets/cv_project/ds1/T03_bark3/';
files = dir(strcat(folder, '*.jpg'));

descs4 = [];

for i = 1:length(files)
    fprintf('Processing image %s... ', files(i).name);
    imPath = strcat(folder, files(i).name);
    
    im = im2double(imread(imPath));
    im = (im - mean(im(:)))/std(im(:));
    
    [f1, f2] = lcr(im, P, R);
    features = rilfm(f1, f2, r1, r2);
    
    descs4 = [descs4; [features, 4]];
    fprintf('Done!!!\n');
end

allDescs = [descs; descs2; descs3; descs4];

%figure
%scatter(allDescs(:,1), allDescs(:,2),[], allDescs(:,3), 'filled')

figure
plot(descs(:,1), descs(:,2),'.','markersize',20,'LineSmoothing','on');
hold on
plot(descs2(:,1), descs2(:,2),'r.','markersize',20,'LineSmoothing','on')
hold on
plot(descs3(:,1), descs3(:,2),'g.','markersize',20,'LineSmoothing','on')
hold on
plot(descs4(:,1), descs4(:,2),'y.','markersize',20,'LineSmoothing','on')


