clc; clear;
pkg load image;

% Ejemplo 1 sobre Histogramas
A = imread('peppers.jpg');
subplot(1, 3, 1);
imshow(A);
[m, n] = size(A);


% Forma 2 de calcular el histograma
h2 = zeros(256, 1);
for i = 0:255
  h2(i+1) = sum(sum(A==i));
endfor

subplot(1, 3, 2);
bar(0:255, h2);
title('Histograma');
xlim([0 255]); % Comando para limitar  los limites del eje x

% Distribucion acumulada
ac = zeros(256, 1);
for i = 0:255
  ac(i+1) = sum(h2(1:i+1))/(m*n);
endfor

subplot(1, 3, 3);
bar(0:255, ac);
title('Distribucion Acumulada');
xlim([0 255]); % Comando para limitar  los limites del eje x
