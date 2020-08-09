% Ejemplo de Umbral
clc; clear; close all;
pkg load image;
A = imread('imagen3.jpg');
subplot(2,2,1);
imshow(A);
title('Imagen original');

A = im2double(A); [m,n] = size(A);

% Umbral Simple (Imagen Binaria)
T = 0.5; B = zeros(m,n);
B(A>T) = 1;
B(A<=T) = 0;
subplot(2,2,2);
imshow(B);
title(['Imagen Umbral T=' num2str(T)]);

% Umbral basico global
T = 0.5; iter = 15;
for k = 1:iter
  % Mascaras de los bloques
  I1 = (A>T);  % Matriz binaria, donde I1(i,j)=1 si A(i,j)>T
  I2 = (A<=T); % Matriz binaria, donde I1(i,j)=1 si A(i,j)<=T
  B1 = A.*I1;  % Bloque 1, donde se cumple que B1(i,j)=A(i,j), si A(i,j)>T;
               %                               B1(i,j)=0, si A(i,j)<=T;
  B2 = A.*I2;            
  m1 = sum(sum(B1))/sum(sum(I1)); % Promedio de intensidad del Bloque 1   
  m2 = sum(sum(B2))/sum(sum(I2)); % Promedio de intensidad del Bloque 1     
  T = 0.5*(m1+m2);
endfor

C = zeros(m,n);
C(A>T) = 1;
C(A<=T) = 0;
subplot(2,2,3);
imshow(C);
title(['Imagen Umbral T=' num2str(T)]);

% Histograma de la imagen original
subplot(2,2,4);
imhist(A);
title('Histograma imagen original');