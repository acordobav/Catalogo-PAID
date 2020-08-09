clc; clear; close all;
pkg load image;
A = imread('edificio_china.jpg');
subplot(1,2,1);
A = im2double(A);
imshow(A);
title('Imagen original');

% Ruido con distribucion uniforme M=A+N, donde
% N toma valores en el intervalo [0, 1]
% Nota: se recomienda trabajar las imagenes en double
% con valor en [0, 1]
[m,n] = size(A);
N = 0.5*rand(m,n); % Matriz aleatoria con valores en [0,1]
M=A+N;
subplot(1,2,2);
F = im2uint8(M); % Convertir una imagen en formato de 8 bits
imshow(F);
title('Imagen con ruido');