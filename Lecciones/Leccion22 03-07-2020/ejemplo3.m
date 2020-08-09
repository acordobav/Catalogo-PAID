% Ejemplo de detectar bordes verticales y horizontales Sobel
clc; clear; close all;
pkg load image;
A = imread('torres.jpg');
A = A(:,:,2); % Trabajar con un solo componente
subplot(1,2,1);
imshow(A);
title('Imagen original');

% Sobel - Ejes verticales
By = [-1  0 1;
     -2  0 2;
     -1  0 1];
     
% Sobel - Ejes horizontales
Bx = [-1 -2 -1;
      0  0  0;
      1  2  1];

% Convolucion
A = im2double(A);
[m,n] = size(A);
Cx = conv2(A,Bx); % Matriz de dimensiones (m+3-1, n+3-1)
Cx = Cx(2:m+1,2:n+1);
Cy = conv2(A,By); % Matriz de dimensiones (m+3-1, n+3-1)
Cy = Cy(2:m+1,2:n+1);
C = im2uint8(sqrt(Cx.^2+Cy.^2));
subplot(1,2,2);   
imshow(C);
title('Bordes con Sobel')