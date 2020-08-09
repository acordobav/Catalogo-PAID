clc; clear;

% Trabajar con imagenes .jpg
A = imread('cameraman.jpg');

% Se cambia el formato a double
A = im2double(A);
[m, n] = size(A);

% Escribe los valores singulares en el vector s
s = svd(A);
r = min([m, n]);

% plot(1:r, s);

[U, S, V] = svd(A);
k = 100; %Factor de compresión
% k = rank(A)
Uk = U(:, 1:k); Sk = S(1:k, 1:k); Vk = V(:, 1:k);
A_k = Uk * Sk * Vk';
subplot(1, 2, 1); % Se divide la grafica en una fila y en dos columnas
imshow(A);
title('Imagen Original')

subplot(1, 2, 2);
imshow(A_k);
title('Imagen Reconstruida')