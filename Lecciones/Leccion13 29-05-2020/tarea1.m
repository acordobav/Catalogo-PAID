clc; clear; close all;

m = 15; n = 15;
A = rand(m, n);
subplot(1, 5, 1);
imshow(A);
title('Matriz Original');

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
subplot(1, 5, 2);
imshow(abs(F));
title('DFT-2D Formula')

% Calculo de la DFT-2D de A con el metodo de Octave
Aux = fft2(A);
F = [];
for j = 1:m
  F(j, :) = flip(Aux(m-j+1, :)'); % Hacer un flip y calcular el conjugado
endfor  
subplot(1, 5, 3);
imshow(abs(F));
title('DFT-2D Octave');

% Calculo de la Inversa de DFT-2D con la Formula
A1 = zeros(m, n);
for x = 1:m % Filas de F
  for y = 1:n % Columnas de F
    for u = 0:m-1
      for v = 0:n-1
        A1(x,y) = A1(x,y)+F(u+1,v+1)*exp(1i*2*pi*(u*x/m+v*y/n));
      endfor  
    endfor  
  endfor  
endfor
A1 = abs(1/(m*n) * A1);
subplot(1, 5, 4);
imshow(A1);
title('Inversa DFT-2D Formula')

% Calculo de la Inversa de DFT-2D con el metodo de Octave
A2 = abs(ifft2(F));
subplot(1, 5, 5);
imshow(A2);
title('Inversa DFT-2D Octave')

