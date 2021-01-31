A = imread('assets/lena.bmp');
oneChannel = im2gray(A);

real = double(oneChannel);
colormap(gray);

noiseImage = real + rand(512,512) * 100;



imgGaussien = filtre_gaussien(3, 10, noiseImage);

laplacienne = [0,1,0; 1,-4,1; 0,1,0];
laplacimg = conv2(imgGaussien, laplacienne, 'same');

imgOut = real + 0.8*laplacimg;

subplot(2,2,1), imagesc(real);
subplot(2,2,2), imagesc(noiseImage);
subplot(2,2,3), imagesc(imgGaussien);
subplot(2,2,4), imagesc(imgOut);