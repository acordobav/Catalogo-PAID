% Ejemplo de operacion Bottom-Hat
clc; clear; close all;
pkg load image;
A = imread('imagen11.jpg');
subplot(1,2,1);
imshow(A);
title('Imagen original');

% Se utilizara un elemento estructurado de dimensiones 3x3
r = 1; % r = 1 -> ventana 3x3

% Paso 1: Dilatacion
C = dilatacion(A,r);

% Paso 2: Erosion
D = erosion(C,r);

% Paso 3: Resta E = D - A
E = D - A;

subplot(1,2,2);
imshow(A+E);
title('Bottom-Hat')