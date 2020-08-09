% Ejemplo del Filtro Promedio Geometrico
clc; clear; close all;
pkg load image;

A = imread('peppers.jpg');
subplot(1,3,1);
imshow(A);
title('Imagen original');

% Se agrega ruido a la imagen original
A = im2double(A);
[m,n] = size(A);
N = 0.075 * randn(m,n);
B = A + N; % Imagen con ruido
B = im2uint8(B);
subplot(1, 3, 2);
imshow(B);
title('Imagen con ruido');

% Calculo del Filtro Geometrico
%%% Tarea: realizar el filtro en los bordes
B = im2double(B);
C = B;
for i = 2:m-1
  for j = 2:n-1
    % Calcular el producto de cada una de las filas, segun una
    % ventana de dimensiones 3x3
    Wf1 = B(i-1,j-1)*B(i-1,j)*B(i-1,j+1); % Fila 1 de la ventana
    Wf2 = B(i,j-1)*B(i,j)*B(i,j+1); % Fila 2 de la ventana
    Wf3 = B(i+1,j-1)*B(i+1,j)*B(i+1,j+1); % Fila 3 de la ventana
    C(i,j) = (Wf1*Wf2*Wf3)^(1/9);
  endfor
endfor  

C = im2uint8(C);
subplot(1,3,3);
imshow(C);
title('Imagen con filtro geometrico');