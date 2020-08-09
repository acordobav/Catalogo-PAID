% Ejemplo de convolucion en imagenes
clc; clear;
pkg load image;

%A = imread('baby_yoda.jpg');
A = imread('bacteria.jpg');
subplot(1, 2, 1);
imshow(A);
title('Imagen original');

% Crear matriz B
B = [1 1 1; 0 0 0; -1 -1 -1]; % Detectar bordes horizontales
% B = [1 0 -1; 1 0 -1; 1 0 -1]; % Detectar bordes verticales
% B = [-1 -1 -1; -1 8 -1; -1 -1 -1]; % Detectar bordes en general
A = double(A);
C = conv2(A, B);
[m, n] = size(A);
C = uint8(C(2:m+1, 2:n+1));
subplot(1, 2, 2);
imshow(C);
title('Imagen con filtro paso alto');
