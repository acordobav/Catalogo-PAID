clc; clear;

% Informacion de la imagen original
A = imread('landscape1.jpg');
A = A(:, :, 1);
imshow(A);
title('Imagen Original');
A = double(A); [m, n] = size(A);

% Calcular el Filtro de Diferencia Direccional B1
B1 = [0 1 0; 0 0 0; 0 -1 0];
C1 = conv2(A, B1);
C1 = uint8(C1);
C1 = C1(2:m+1, 2:n+1);
imshow(C1);
title('Filtro B1');

% Calcular el Filtro de Diferencia Direccional B2
B2 = [0 0 0; 1 0 -1; 0 0 0];
C2 = conv2(A, B2);
C2 = uint8(C2);
C2 = C2(2:m+1, 2:n+1);
imshow(C2);
title('Filtro B2');

% Calcular el Filtro de Diferencia Direccional B3
B3 = [1 0 0; 0 0 0; 0 0 -1];
C3 = conv2(A, B3);
C3 = uint8(C3);
C3 = C3(2:m+1, 2:n+1);
imshow(C3);
title('Filtro B3');

% Calcular el Filtro de Diferencia Direccional B4
B4 = [0 0 -1; 0 0 0; 1 0 0];
C4 = conv2(A, B4);
C4 = uint8(C4);
C4 = C4(2:m+1, 2:n+1);
imshow(C4);
title('Filtro B4');