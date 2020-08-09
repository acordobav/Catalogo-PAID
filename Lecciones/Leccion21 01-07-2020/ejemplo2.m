% Ejemplo de erosion en una imagen a escala de grises
clc; clear; close all;
pkg load image;
A = imread('imagen10.jpg');
subplot(1,2,1);
imshow(A);
title('Imagen original');

% Se utilizara un elemento estructurado de dimensiones 3x3
[m,n] = size(A);
C = uint8(zeros(m,n));
% Tarea: Calcular la erosion de los bordes
C(1,:) = A(1,:); C(m,:) = A(m,:);
C(:,1) = A(:,1); C(:,n) = A(:,n);

for i = 2:m-1
  for j = 2:n-1
    Aux = A(i-1:i+1,j-1:j+1);
    v = Aux(:);
    C(i,j) = min(v);
  endfor
endfor

subplot(1,2,2);
imshow(C);
title('Erosion')
