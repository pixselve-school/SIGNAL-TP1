A = imread('neuro.jpeg');
% image(A);
oneChannel = rgb2gray(A);
% image(oneChannel);
real = double(oneChannel);
colormap(gray);
% imagesc(real);

sigma = 6.0;
size=8;

g=zeros(size,size);
for i= 1:size
    for j= 1:size
        g(i,j)= (1 / (sigma * sqrt(2 * pi))) * exp(-(((i - ceil(N / 2))^2 + (j - ceil(N / 2))^2) / (2 * sigma^2)));
    end
end
filter = g;

imgBlur = conv2(real, filter, 'same');
% imagesc(imgBlur);

laplacienne = [0,1,0; 1,-4,1; 0,1,0];
laplacimg = conv2(imgBlur, laplacienne, 'same');
% imagesc(laplacimg);

imgOut = real + 0.8*laplacimg;
imagesc(imgOut);

