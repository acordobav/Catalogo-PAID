% Filtro Butterworth
clc; clear; close all;
pkg load image

A = imread('imagen_rp.jpg');
subplot(2,3,1);
imshow(A);
title('Imagen con ruido periodico');

A_d = im2double(A);
F2 = fft2(A_d);
D2 = fftshift(F2);
subplot(2,3,2);
imshow(log(1+abs(D2)),[]);
title('Frecuencia imagen');


% Filtro de rechazo de banda butterworth
% Matriz de distancias
[m,n] = size(A);
dist = zeros(m,n);
m1 = floor(m/2); n1 = floor(n/2);
for i = 1:m
  for j = 1:n
    dist(i,j) = sqrt((i-m1)^2 + (j-n1)^2);
  endfor
endfor

W = 8; D0 = 32; n = 2;
H = 1./(1+((dist*W)./(dist.^2-D0^2)).^(2*n));

subplot(2,3,3);
imshow(H)
title('Filtro de rechazo de banda butterworth');

Ff = fftshift(H).*F2;
D4 = fftshift(Ff);
subplot(2,3,4);
imshow(log(1+abs(D4)), []);
title('Frecuencia de la imagen con el filtro');

I_rec = ifft2(Ff);
subplot(2,3,5);
I_mos = im2uint8(real(I_rec));
imshow(I_mos);
title('Imagen filtrada');