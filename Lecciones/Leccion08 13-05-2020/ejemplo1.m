clc; clear;
pkg load image;

% Ejemplo 1 sobre Histogramas
A = imread('peppers.jpg');
subplot(2, 2, 1);
imshow(A);

% Forma 1 de calcular el histograma
h1 = zeros(256, 1); %h1 = [h(0) h(1) h(2) ... h(255)]
[m, n] = size(A);
tic % Calcular el tiempo de la forma 1
for i = 1:m
  for j = 1:n
    h1(A(i, j) + 1) = h1(A(i, j) + 1) + 1;
  endfor
endfor

subplot(2, 2, 2);
bar(0:255, h1);
title('Forma 1');
xlim([0 255]); % Comando para limitar  los limites del eje x
t1 = toc;

% Forma 2 de calcular el histograma
h2 = zeros(256, 1);

tic % Calcular el tiempo de la forma 2
for i = 0:255
  h2(i+1) = sum(sum(A==i));
endfor

subplot(2, 2, 3);
bar(0:255, h2);
title('Forma 2');
xlim([0 255]); % Comando para limitar  los limites del eje x
t2 = toc;

% Forma 3 de calcular el histograma
subplot(2, 2, 4)
tic % Calcular el tiempo de la forma 3
imhist(A); % Comando de Octave para graficar el histograma
title('Forma 3');
t3 = toc;