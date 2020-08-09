% Ejemplo del Filtro Armonico Promedio
clc; clear; close all;
pkg load image;

A = imread('peppers.jpg');
subplot(1,3,1);
imshow(A);
title('Imagen original');

% Se agrega ruido a la imagen original
A = im2double(A);
[m,n] = size(A);
N = salt_noise(m,n,0.06);
B = A + N; % Imagen con ruido
B = im2uint8(B);
subplot(1, 3, 2);
imshow(B);
title('Imagen con ruido');

% Calculo del Filtro Armonico Promedio
B = im2double(B);
r = 1; % Radio de la ventana, con r = 1 -> ventana = 3x3
C = filtro_armonico_promedio(B, r);

C = im2uint8(C);
subplot(1,3,3);
imshow(C);
title('Imagen con filtro armonico promedio');