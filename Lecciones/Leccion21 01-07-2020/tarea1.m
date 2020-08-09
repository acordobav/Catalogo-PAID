% Ejemplo de dilatacion en una imagen a escala de grises
clc; clear; close all;
pkg load image;
A = imread('imagen10.jpg');
subplot(1,2,1);
imshow(A);
title('Imagen original');

% Se utilizara un elemento estructurado de dimensiones 3x3
r = 1; % r = 1 -> ventana 3x3
C = dilatacion(A,r);
subplot(1,2,2);
imshow(C);
title('Dilatacion')