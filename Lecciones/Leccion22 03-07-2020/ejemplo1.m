% Ejemplo de detectar bordes con una mascara laplaciana
clc; clear; close all;
pkg load image;
A = imread('torres.jpg');
A = A(:,:,2); % Trabajar con un solo componente
subplot(1,2,1);
imshow(A);
title('Imagen original');

% Laplaciano
B = [-1 -1 -1;
     -1  8 -1;
     -1 -1 -1];
     
% Convolucion
A = im2double(A);
[m,n] = size(A);
C = conv2(A,B); % Matriz de dimensiones (m+3-1, n+3-1)
C = C(2:m+1,2:n+1);
C = im2uint8(C);
subplot(1,2,2);   
imshow(C);
title('Bordes con el Laplaciano')