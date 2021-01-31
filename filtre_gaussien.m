function [imageResult] = filtre_gaussien(taille, sigma, imageInput)
% Applique un filtre gaussien de taille "taille" et d'écart-type "sigma" à
% l'image "imageInput"
filtre=zeros(taille,taille);
for i= 1:taille
    for j= 1:taille
        filtre(i,j)= (1 / (sigma * sqrt(2 * pi))) * exp(-(((i - ceil(taille / 2))^2 + (j - ceil(taille / 2))^2) / (2 * sigma^2)));
    end
end

imageResult = conv2(imageInput, filtre, 'same');

end

