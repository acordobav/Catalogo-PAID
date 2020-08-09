clc; clear; close all;
pkg load image;

A = imread('imagen7.jpg');
A = binaria(im2double(A));
subplot(1,2,1);
imshow(A);
title('Imagen original');

% Elemento estructurado
B = [0 1 0; 1 1 1; 0 1 0];

% Rellenar el hueco de la imagen
[m,n] = size(A);
X = zeros(m,n);
x1 = floor(m/2); y1 = floor(n/2);
X(x1,y1) = 1;

iter = 100;
for i = 1:iter
  C = imdilate(X,B);
  X = C&~A;
  subplot(1,2,2);
  imshow(X);
  title(['Iteracion ' num2str(i)]);
  pause(0.25);
endfor
