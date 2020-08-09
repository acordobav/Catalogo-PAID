% Ruido Periodico
clc; clear; close all;
pkg load image

A = imread('sin_ruido.png');
subplot(2,2,1);
imshow(A);
title('Imagen original');

B = imread('periodico_ruido.png');
subplot(2,2,2);
imshow(B);
title('Imagen con ruido periodico');

A_d = im2double(A);
F1 = fft2(A_d);
D1 = fftshift(F1);
subplot(2,2,3);
imshow(log(1+abs(D1)),[]);
title('Frecuencia imagen original');

B_d = im2double(B);
F2 = fft2(B_d);
D2 = fftshift(F2);
subplot(2,2,4);
imshow(log(1+abs(D2)),[]);
title('Frecuencia imagen con ruido periodico')
