% Ruido Periodico
clc; clear; close all;
pkg load image

A = imread('camarografo.jpg');
subplot(1,3,1);
imshow(A);
title('Imagen original');

B = imread('ruido_periodico.jpg');
subplot(1,3,2);
imshow(B);
title('Ruido periodico');

A_d = im2double(A);
B_d = im2double(B);
C_d = A_d+0.45*B_d; % Imagen en formato double
C = im2uint8(C_d);
imwrite(C, 'imagen_rp.jpg');
subplot(1,3,3);
imshow(C);
title('Imagen con ruido periodico');