clc; clear;
pkg load image;

% Ejemplo sobre Estiramiento del Histograma

A = imread('sydney.jpg');
subplot(2, 2, 1);
imshow(A);

% Calculo del histograma de A
for i = 0:255
  h2(i+1) = sum(sum(A==i));
endfor
subplot(2, 2, 2);
bar(0:255, h2);
title('Forma 2');
xlim([0 255]); % Comando para limitar los valores del eje x

% Modificacion de la Imagen, Estiramiento del Histograma
r_min = min(min(A));
r_max = max(max(A));
B = (255 / (r_max - r_min)) * (A - r_min);
subplot(2, 2, 3);
imshow(B);

% Calculo del histograma de B
for i = 0:255
  h2(i+1) = sum(sum(B==i));
endfor
subplot(2, 2, 4);
bar(0:255, h2);
title('Forma 2');
xlim([0 255]); % Comando para limitar los valores del eje x
 