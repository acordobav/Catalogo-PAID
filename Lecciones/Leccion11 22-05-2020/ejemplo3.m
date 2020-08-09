% Filtro de la media
clc; clear;
pkg load image;

A = imread('barbara.jpg');
A = A(:, :, 1);
subplot(1, 2, 1);
imshow(A);
title('Imagen con ruido');

% Filtro de la Mediana
[m, n] = size(A);
B = zeros(m, n);
% Calcular el filtro en los bordes de la imagen (TAREA)
B(:, 1) = A(:, 1); B(:, n) = A(:, n);
B(1, :) = A(1, :); B(n, :) = A(n, :); 

% Calcular el filtro en la parte central de la imagen
for x = 2:m-1
  for y = 2:n-1
    Bloque = A(x-1:x+1, y-1:y+1); % Bloque para calcular la mediana
    vecAux = Bloque(:); % Convertir una matriz en un vector
    B(x, y) = median(vecAux);
  end
end
B = uint8(B);
subplot(1, 2, 2);
imshow(B);
title('Imagen Filtrada (Mediana)');

