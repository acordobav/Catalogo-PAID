% Ejemplo de detectar bordes verticales Sobel
clc; clear; close all;
pkg load image;
A = imread('torres.jpg');
A = A(:,:,2); % Trabajar con un solo componente
subplot(1,2,1);
imshow(A);
title('Imagen original');

% Sobel - Ejes verticales
B = [-1  0 1;
     -2  0 2;
     -1  0 1];
     
% Convolucion
A = im2double(A);
[m,n] = size(A);
C = conv2(A,B); % Matriz de dimensiones (m+3-1, n+3-1)
C = C(2:m+1,2:n+1);
C = im2uint8(C);
subplot(1,2,2);   
imshow(C);
title('Bordes verticales con Sobel')