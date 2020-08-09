% Filtro rechazo banda ideal
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
title('Frecuencia imagen con ruido periodico');


% Filtro de rechazo de banda ideal
% Matriz de distancias
[m,n] = size(A);
dist = zeros(m,n);
m1 = floor(m/2); 
n1 = floor(n/2);
for i = 1:m
  for j = 1:n
    dist(i,j) = sqrt((i-m1)^2 + (j-n1)^2);
  endfor
endfor

W = 8; D0 = 32; H = ones(m,n);
ind = and(D0-W/2<=dist, dist<=D0+W/2);
H(ind) = 0;

subplot(2,3,3);
imshow(H)
title('Filtro de rechazo de banda ideal');

Ff = fftshift(H).*F2;
D4 = fftshift(Ff);
subplot(2,3,4);
imshow(log(1+abs(D4)), []);
title('Frecuencia de la imagen con el filtro')

I_rec = ifft2(Ff);
subplot(2,3,5);
I_mos = im2uint8(real(I_rec));
imshow(I_mos);
title('Imagen filtrada');