% Ejemplo de operacion Top-Hat: A-(A o B) = A-[(A -o- B) ? B]
clc; clear; close all;
pkg load image;
A = imread('imagen11.jpg');
subplot(1,2,1);
imshow(A);
title('Imagen original');

% Paso 1: Erosion C = A -o- B
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

% Paso 2: Dilatacion D = C ? B
D = uint8(zeros(m,n));
% Tarea: Calcular la erosion de los bordes
D(1,:) = C(1,:); D(m,:) = C(m,:);
D(:,1) = C(:,1); D(:,n) = C(:,n);

for i = 2:m-1
  for j = 2:n-1
    Aux = C(i-1:i+1,j-1:j+1);
    v = Aux(:);
    D(i,j) = max(v);
  endfor
endfor

% Paso 3: Resta E = A - D
E = A - D;

subplot(1,2,2);
imshow(A+E);
title('Top-Hat')
