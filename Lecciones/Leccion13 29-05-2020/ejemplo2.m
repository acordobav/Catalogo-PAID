clc; clear;
close all;
X = imread('chest.jpg');
% Sugerencia, cuando trabajemos en el dominio de la frecuencia.
% entonces transformaremos la imagen de formato 8 bits a una en
% formato double, con valores entre 0 y 1
X = im2double(X);
subplot(1, 2, 1);
imshow(X);
title('Imagen en el Dominio Espacial');

% Calcular la DFT-2D de la imagen
[m, n] = size(X);
Aux = fft2(X);
F = [];
for j = 1:m
  F(j, :) = flip(Aux(m-j+1, :)'); % Hacer un flip y calcular el conjugado
endfor 
F = fftshift(F);
subplot(1, 2, 2);
imshow(log(1+abs(F)), []);
title('Imagen en el Dominio de la Frecuencia');