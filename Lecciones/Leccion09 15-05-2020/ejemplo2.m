clc; clear;
pkg load image;

% Ejemplo sobre Reduccion del Histograma
A = imread('peppers.jpg');
subplot(2, 2, 1);
imshow(A);

A = double(A); % Convertir los valores de imagen a numero real

% Calculo del histograma de A
for i = 0:255
  h2(i+1) = sum(sum(A==i));
endfor
subplot(2, 2, 2);
bar(0:255, h2);
title('Forma 2');
xlim([0 255]); % Comando para limitar los valores del eje x

% Modificacion de la Imagen, Reduccion del Histograma
r_min = min(min(A)) % = 0
r_max = max(max(A)) % = 227
s_min = 100;
s_max = 175;
[m, n] = size(A);
B = zeros(m, n);

B = round((((s_max - s_min) / (r_max - r_min)) * (A - r_min)) + s_min); 
B = uint8(B);
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
 