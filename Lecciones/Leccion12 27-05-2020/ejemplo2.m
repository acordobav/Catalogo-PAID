clc; clear;

% Informacion de la imagen original
A = imread('Columnas.jpg');
A = A(:, :, 1);
subplot(1, 3, 1);
imshow(A);
title('Imagen Original')

% Calcular el Laplaciano
A = double(A); [m, n] = size(A);
B = [-1 -1 -1; -1 8 -1; -1 -1 -1];
C = conv2(A, B);
C = uint8(C);
C = C(2:m+1, 2:n+1);
subplot(1, 3, 2);
imshow(C);
title('Laplaciano de la imagen');

% Utilizar el Laplaciano para enfatizar los bordes de la imagen
alpha = 0.75;
D = A + alpha * double(C);
D = uint8(D);
subplot(1, 3, 3);
imshow(D);
title('Imagen Modificada con el Laplaciano')