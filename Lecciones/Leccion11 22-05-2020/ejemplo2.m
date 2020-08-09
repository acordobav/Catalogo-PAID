% Filtro Gaussiano - Paso Bajo
clc; clear;
pkg load image;

A = imread('Columnas.jpg');
%A = imread('bacteria.jpg');
subplot(1, 2, 1);
imshow(A);
title('Imagen original');

% Crear matriz B
B = (1/16)*[1 2 1; 2 4 2; 1 2 1]; % Detectar bordes verticales
[m, n] = size(A);
A = double(A);
C = conv2(A, B);
D = C(2:m+1, 2:n+1);
D = uint8(D);
subplot(1, 2, 2);
imshow(D);
title('Imagen Filtro Gaussiano');