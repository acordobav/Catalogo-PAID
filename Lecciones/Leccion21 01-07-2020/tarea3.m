% Ejemplo de operacion Top-Hat
clc; clear; close all;
pkg load image;
A = imread('imagen11.jpg');
subplot(1,2,1);
imshow(A);
title('Imagen original');

% Se utilizara un elemento estructurado de dimensiones 3x3
r = 1; % r = 1 -> ventana 3x3

% Paso 1: Erosion C = A -o- B
C = erosion(A,r);

% Paso 2: Dilatacion D = C ? B
D = dilatacion(C,r);

% Paso 3: Resta E = A - D
E = A - D;

subplot(1,2,2);
imshow(A+E);
title('Top-Hat')