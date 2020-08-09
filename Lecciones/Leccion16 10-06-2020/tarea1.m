% Ejemplo Filtro Promedio
clc; clear; close all;
pkg load image;

A = imread('peppers.jpg');
subplot(1,3,1);
imshow(A);
title('Imagen original');

% Se agrega ruido a la imagen original
A = im2double(A);
[m,n] = size(A);
N = 0.1 * randn(m,n);
B = A + N; % Imagen con ruido
subplot(1, 3, 2);
imshow(im2uint8(B));
title('Imagen con ruido');

% radio = 1 -> ventana 3x3
% radio = 2 -> ventana 5x5
% radio = 3 -> ventana 7x7
% ...
% radio = n -> ventana (2n+1)x(2n+1)
C = filtro_promedio(B, 1);
subplot(1, 3, 3);
imshow(im2uint8(C));
title('Imagen filtrada')