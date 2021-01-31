A = imread('assets/neuro.jpeg');

oneChannel = rgb2gray(A);

real = double(oneChannel);
colormap(gray);

size = 8;
imgGaussien = filtre_gaussien(size, 6, real);
imgMoyen = conv2(single(real), ones(size)/size^2);

subplot(2,2,1), imagesc(imgGaussien)
subplot(2,2,2), imagesc(imgMoyen)

laplacienne = [0,1,0; 1,-4,1; 0,1,0];
laplacimg = conv2(imgGaussien, laplacienne, 'same');


imgOut = real + 0.8*laplacimg;

subplot(2,2,3), imagesc(imgOut)