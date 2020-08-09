% Ejemplo de Umbral
clc; clear; close all;
pkg load image;
A = imread('imagen2.jpg');
subplot(2,3,1);
imshow(A);
title('Imagen original');

% Histograma
subplot(2,3,4);
imhist(A);
title('Histograma');

A = im2double(A);
[m,n] = size(A);

% Ruido 1
a1 = 0.2^2;
B1 = A+a1*randn(m,n);
subplot(2,3,2);
imshow(B1);
title('Imagen con ruido 1');

% Histograma
subplot(2,3,5);
imhist(B1);
title('Histograma');

% Ruido 2
a2 = 0.5^2;
B2 = A+a2*randn(m,n);
subplot(2,3,3);
imshow(B2);
title('Imagen con ruido 2');

% Histograma
subplot(2,3,6);
imhist(B2);
title('Histograma');