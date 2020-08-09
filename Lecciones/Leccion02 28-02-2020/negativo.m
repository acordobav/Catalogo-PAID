% Aclarar una imagen
clc; clear;
A = imread('cameraman.jpg');
subplot(1, 2, 1);
imshow(A);
title('Imagen Original');

% negativo
subplot(1, 2, 2);
A = im2double(A);
imshow(-A + 1);
title('Imagen en Negativo');
