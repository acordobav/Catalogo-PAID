clc; clear; close all;
pkg load imageñ
% No implementar manualmente la dilatacion

A = imread('imagen-1.jpg');
A = im2double(A);
A = binaria(A);
subplot(1,2,1);
imshow(A);
title('Imagen original');

% B = [ones(2) zeros(2); zeros(2) ones(2)]
B = strel('diamond',1);
D = imdilate(A,B); % Dilatacion de A y B
subplot(1,2,2);
imshow(D);
title('Imagen Dilatada')

