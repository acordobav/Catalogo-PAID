% Ejemplo de convolucion en imagenes
clc; clear;
pkg load image;

A = imread('baby_yoda.jpg');
subplot(1, 4, 1);
imshow(A);
title('Imagen original');

% Crear matriz B
B = [1 1 1; 0 0 0; -1 -1 -1]; % Detectar bordes horizontales
A = double(A);
C = conv2(A, B);
[m, n] = size(A);
C = uint8(C(2:m+1, 2:n+1));
subplot(1, 4, 2);
imshow(C);
title('Bordes horizontales');

% Crear matriz B
B = [1 0 -1; 1 0 -1; 1 0 -1]; % Detectar bordes verticales
A = double(A);
C = conv2(A, B);
[m, n] = size(A);
C = uint8(C(2:m+1, 2:n+1));
subplot(1, 4, 3);
imshow(C);
title('Bordes verticales');

% Crear matriz B
B = [-1 -1 -1; -1 8 -1; -1 -1 -1]; % Detectar bordes en general
A = double(A);
C = conv2(A, B);
[m, n] = size(A);
C = uint8(C(2:m+1, 2:n+1));
subplot(1, 4, 4);
imshow(C);
title('Bordes');