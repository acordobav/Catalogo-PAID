% Ejemplo de Umbral
clc; clear; close all;
A = imread('imagen1.jpg');
subplot(1,3,1);
imshow(A);
title('Imagen original');

A = im2double(A); [m,n] = size(A);

% Umbral Simple (Imagen Binaria)
T = 0.5; B = zeros(m,n);
B(A>T) = 1;
B(A<=T) = 0;
subplot(1,3,2);
imshow(B);
title('Imagen Umbral Simple');

% Umbral Compuesto
T1 = 0.33; T2 = 0.66; C = zeros(m,n);
C(A>T2) = 1;
C(and(T1<A, A<=T2)) = 0.5;
C(A<=T1) = 0;
subplot(1,3,3);
imshow(C);
title('Imagen Umbral Simple');