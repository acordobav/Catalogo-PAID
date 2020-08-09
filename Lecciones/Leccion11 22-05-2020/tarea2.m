% Filtro de la media
clc; clear;
pkg load image;

A = imread('barbara.jpg');
A = A(:, :, 1);
subplot(1, 2, 1);
imshow(A);
title('Imagen con ruido');

% Filtro de la Mediana
[m, n] = size(A);
B = zeros(m, n);

% Filtro en las esquinas de la imagen
B(1, 1) = median(A(1:2, 1:2)(:)); % Esquina superior-izquierda
B(m, 1) = median(A(m-1:m, 1:2)(:)); % Esquina inferior-izquierda
B(1, n) = median(A(1:2, n-1:n)(:)); % Esquina superior-derecha
B(m, n) = median(A(m-1:m, n-1:n)(:)); % Esquina inferior-derecha

%Filtrado de los bordes laterales
for x = 2:m-1
  B(x, 1) = median(A(x-1:x+1, 1:2)(:)); % Borde izquierdo
  B(x, n) = median(A(x-1:x+1, n-1:n)(:)); % Borde derecho
endfor

% Filtrado de los bordes superior e inferior
for y = 2:n-1
  B(1, y) = median(A(1:2,y-1:y+1)(:)); % Borde superior
  B(1, y) = median(A(m-1:m,y-1:y+1)(:)); % Borde inferior
endfor  

% Calcular el filtro en la parte central de la imagen
for x = 2:m-1
  for y = 2:n-1
    Bloque = A(x-1:x+1, y-1:y+1); % Bloque para calcular la mediana
    vecAux = Bloque(:); % Convertir una matriz en un vector
    B(x, y) = median(vecAux);
  end
end
B = uint8(B);
subplot(1, 2, 2);
imshow(B);
title('Imagen Filtrada (Mediana)');
