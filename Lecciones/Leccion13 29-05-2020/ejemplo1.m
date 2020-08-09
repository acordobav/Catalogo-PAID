clc; clear;
close all; % Cierra todas las figuras que estan abiertas

m = 15; n = 15;
A = rand(m, n);
subplot(1, 3, 1);
imshow(A);
title('Matriz en el Dominio Espacial');

tic
% Implementacion de la DFT-2D, usando la formula original
F = zeros(m, n);
for u = 1:m % Filas de F
  for v = 1:n % Columnas de F
    for x = 0:m-1
      for y = 0:n-1
        F(u, v) = F(u,v)+A(x+1,y+1)*exp(-1i*2*pi*(u*x/m+v*y/n));
      endfor
    endfor
  endfor
endfor
t1 = toc

subplot(1, 3, 2);
imshow(abs(F));
title('Matriz en el Dominio de Frecuencia (Formula original)')

% Implementacion de la DFT-2D, usando el comando de Octave
tic
Aux = fft2(A);
F1 = [];
for j = 1:m
  F1(j, :) = flip(Aux(m-j+1, :)'); % Hacer un flip y calcular el conjugado
endfor  
t2 = toc
subplot(1, 3, 3);
imshow(abs(F1));
title('Octave');
