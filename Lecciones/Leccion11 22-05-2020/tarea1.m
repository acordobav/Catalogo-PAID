clc; clear;
% Crear matriz B
k = 7;
B2 = (1/(k^2)) * ones(k, k);

A = imread('Columnas.jpg');
subplot(1, 2, 1);
imshow(A);
title('Imagen original');

A = double(A);
C = conv2(A, B2);

[m1, n1] = size(A);
[m2, n2] = size(C);

mitad_m1 = floor(m1 / 2);
mitad_n1 = floor(n1 / 2);

inicio_m = floor((m2 / 2)) - mitad_m1;
final_m  = floor((m2 / 2)) + mitad_m1;
inicio_n = floor((n2 / 2)) - mitad_n1;
final_n  = floor((n2 / 2)) + mitad_n1;

D = uint8(C(inicio_m:final_m, inicio_n:final_n));

subplot(1, 2, 2);
imshow(D);
title(['Imagen Filtro Promedio k = ' num2str(k)]);