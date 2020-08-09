% Ejemplo del Filtro Minimo
clc; clear; close all;
pkg load image;

A = imread('peppers.jpg');
subplot(1,3,1);
imshow(A);
title('Imagen original');

% Se agrega ruido a la imagen original
A = im2double(A);
[m,n] = size(A);
N = salt_noise(m,n,0.15);
B = A + N; % Imagen con ruido de tipo sal
B = im2uint8(B);
subplot(1, 3, 2);
imshow(B);
title('Imagen con ruido');

% Calculo del Filtro Minimo
B = im2double(B);
r = 1; % Radio de la ventana, con r = 1 -> ventana = 3x3
C = filtro_minimo(B, r);

C = im2uint8(C);
subplot(1,3,3);
imshow(C);
title('Filtro minimo');