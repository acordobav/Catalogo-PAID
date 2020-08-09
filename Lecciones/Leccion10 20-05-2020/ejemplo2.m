% Ejemplo de convolucion en imagenes
clc; clear;
pkg load image;

A = imread('child.jpg');
subplot(1, 2, 1);
imshow(A);
title('Imagen original');

% Crear matriz B
B = [0 -1 0; -1 5 -1; 0 -1 0]; % Filtro Paso-Alto
A = double(A);
C = conv2(A, B);
[m, n] = size(A);
C = uint8(C(2:m+1, 2:n+1));
subplot(1, 2, 2);
imshow(C);
title('Imagen con filtro paso alto');
