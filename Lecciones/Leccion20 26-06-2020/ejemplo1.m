clc; clear; close all;
pkg load image;

A = imread('imagen5.jpg');
A = binaria(im2double(A));
subplot(1,2,1);
imshow(A);
title('Imagen original');

B = [0 1 0; 1 1 1; 0 1 0]; %ones(2);
% Apertura morfologica de A por B
% C1 = imerode(A,B);
% C = imdilate(C1,B);
C = imopen(A,B); % El comando de apertura de A por B
subplot(1,2,2);
imshow(C);
title('Operador de apertura');