% Ejemplo del Filtro Contraarmonico Promedio
clc; clear; close all;
pkg load image;

A = imread('peppers.jpg');
subplot(1,3,1);
imshow(A);
title('Imagen original');

% Se agrega ruido a la imagen original
A = im2double(A);
[m,n] = size(A);
N = pepper_noise(m,n,0.15);
B = A + N; % Imagen con ruido de tipo pimienta
B = im2uint8(B);
subplot(1, 3, 2);
imshow(B);
title('Imagen con ruido');

% Calculo del Filtro Contraarmonico Promedio
B = im2double(B);
R = 2; % Orden del filtro
r = 1; % Radio de la ventana, con r = 1 -> ventana = 3x3
C = filtro_contraarmonico_promedio(B, R, r);

C = im2uint8(C);
subplot(1,3,3);
imshow(C);
title('Filtro contraarmonico promedio');