clc; clear; close all;
pkg load image;

% Carga de la imagen original
A = imread('imagen6.jpg');
subplot(1,3,1);
imshow(A);
title('Imagen original')
[m,n] = size(A);

% Umbral con el metodo de Otsu
T = otsu(A);
B = zeros(m,n);
B(A>T) = 1;
B(A<=T) = 0;
subplot(1,3,2);
imshow(B);
title(['Umbral Otsu: T=' num2str(T)]);

% Umbrales con el metodo de otsu para 2 umbrales
[T1,T2] = otsu2(A);
C = im2double(zeros(m,n));
C(T1<A<T2) = 0.5;
C(A<=T1) = 0;
C(T2<=A) = 1;
subplot(1,3,3);
imshow(C);
title(['Umbral Compuesto Otsu: T1=' num2str(T1) ' T2=' num2str(T2)]);