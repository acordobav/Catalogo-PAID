% Ejemplo Filtro Gaussiano (Paso Alto)
clc; clear; close all;
pkg load image;

X = imread('edificio_china.jpg');
subplot(2, 3, 1);
imshow(X);
title('Imagen Original');
X = im2double(X);

% Calcular DFT-2D de la imagen
F = fft2(X);
F_shift = fftshift(F);
subplot(2, 3, 2);
imshow(log(1+abs(F_shift)), []);
title('DFT-2D de la Imagen');

% Calcular el Filtro Gaussiano en el Dominio de la Frecuencia
% 1. Calcular la matriz de distancia
[m, n] = size(X); dist = zeros(m, n);
m1 = floor(m/2); n1 = floor(n/2);
for i = 1:m
  for j = 1:n
    dist(i, j) = sqrt((i-m1)^2 + (j-n1)^2);
  endfor
endfor
% 2. Obtener el Filtro Gaussiano
sigma = 50;
H = 1-exp(-(dist.^2)/(2*sigma^2));

H_nc = fftshift(H);
subplot(2, 3, 3);
imshow(H_nc);
title('Filtro Gaussiano (No centrado)')

subplot(2, 3, 4);
imshow(H);
title('Filtro Gaussiano (Centrado)')

% Aplicar el filtro
DFT2_filt = F.*H_nc;
FM_shift = fftshift(DFT2_filt);
subplot(2, 3, 5);
imshow(log(1+abs(FM_shift)), [])
title('DFT-2D con el Filtro Gaussiano')

% Imagen filtrada
I_new = real(ifft2(DFT2_filt));
subplot(2, 3, 6);
imshow(I_new);
title('Imagen Filtro Gaussiano');
