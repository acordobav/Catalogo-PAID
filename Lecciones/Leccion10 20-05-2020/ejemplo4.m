% Ejemplo de convolucion en imagenes
clc; clear;
pkg load image;

A = imread('baby_yoda.jpg');
%A = imread('bacteria.jpg');
subplot(1, 2, 1);
imshow(A);
title('Imagen original');

% Crear matriz B
B1 = [1 1 1; 0 0 0; -1 -1 -1]; % Detectar bordes horizontales
B2 = [1 0 -1; 1 0 -1; 1 0 -1]; % Detectar bordes verticales
A = double(A);
C1 = conv2(A, B1);
C2 = conv2(A, B2);
[m, n] = size(A);
C1 = uint8(C1(2:m+1, 2:n+1));
C2 = uint8(C2(2:m+1, 2:n+1));
subplot(1, 2, 2);
imshow((C1+C2)/2);
title('Imagen filtrada');
