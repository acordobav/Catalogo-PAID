clc; clear;
pkg load image;

% Ejemplo 1 sobre Histogramas
A = imread('sydney.jpg');
subplot(2, 2, 1);
imshow(A);
[m, n] = size(A);


% Forma 2 de calcular el histograma
h2 = zeros(256, 1);
for i = 0:255
  h2(i+1) = sum(sum(A==i));
endfor

subplot(2, 2, 2);
bar(0:255, h2);
title('Histograma');
xlim([0 255]); % Comando para limitar  los limites del eje x

% Distribucion acumulada
ac = zeros(256, 1);
for i = 0:255
  ac(i+1) = sum(h2(1:i+1))/(m*n);
endfor

% Obtener la nueva imagen aplicando la tecnica de ecualizacion
B = zeros(m, n); B = uint8(B);
for i = 1:m
  for j = 1:n
    B(i, j) = round(ac(A(i, j) + 1)* 255);
  end 
end    
 
subplot(2, 2, 3);
imshow(B);

% Forma 2 de calcular el histograma
h2 = zeros(256, 1);
for i = 0:255
  h2(i+1) = sum(sum(B==i));
endfor

subplot(2, 2, 4);
bar(0:255, h2);
title('Histograma');
xlim([0 255]); % Comando para limitar  los limites del eje x
