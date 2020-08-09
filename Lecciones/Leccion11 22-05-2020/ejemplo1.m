% Ejemplo de convolucion con el Operador de Sobel
clc; clear;
pkg load image;

A = imread('Columnas.jpg');
%A = imread('bacteria.jpg');
subplot(1, 2, 1);
imshow(A);
title('Imagen original');

% Crear matriz B
B1 = [-1 0 1; -2 0 2; -1 0 1]; % Detectar bordes verticales
B2 = [-1 -2 -1; 0 0 0; 1 2 1]; % Detectar bordes horizontales
A = double(A);
D1 = conv2(A, B1);
D2 = conv2(A, B2);
[m, n] = size(A);
E = sqrt(D1.^2 + D2.^2);
E = uint8(E(2:m+1, 2:n+1));

subplot(1, 2, 2);
imshow(E);
title('Imagen Operador de Sobel');