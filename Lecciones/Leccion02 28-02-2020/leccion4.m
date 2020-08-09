% Aclarar una imagen
clc; clear;
A = imread('cameraman.jpg');
subplot(1, 3, 1);
imshow(A);
title('Imagen Original');

% para aclarar se debe sumar un numero entre 0 y 275
subplot(1, 3, 2);
imshow(A + 75);
title('Aclarar(+75)');

% para oscurecer se debe restar un numero entre 0 y 275
subplot(1, 3, 3);
imshow(A - 75);
title('Oscurecer(-75)');