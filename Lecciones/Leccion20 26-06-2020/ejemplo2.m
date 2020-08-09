clc; clear; close all;
pkg load image;

A = imread('imagen6.jpg');
A = binaria(im2double(A));
subplot(1,2,1);
imshow(A);
title('Imagen original');

% Elemento estructurado
B = [0 1 0; 1 1 1; 0 1 0];

% Borde interno: A - (A erosion B)
C = imerode(A,B);
D = A&~C;
 
subplot(1,2,2);
imshow(D);
title('Borde interno');