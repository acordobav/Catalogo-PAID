% Combinar dos imagenes
clc; clear;

% Trabajar con imagenes .jpg
A = imread('cameraman.jpg');
B = imread('fondo.jpg');
A = im2double(A);
B = im2double(B);
C = (1/3) * (B(:, :, 1) + B(:, :, 2) + B(:, :, 3));
% imshow(C)

pkg load image

A1 = imresize(A, [256, 256]);
C1 = imresize(C, [256, 256]);
subplot(1, 3, 1);
imshow(A1);
subplot(1, 3, 2);
imshow(C1);
subplot(1, 3, 3);
imshow((1/2) * (A1 + C1)); % Cuando se suman imagenes lo mejor es promediar
% entre la cantidad de imagenes, por eso el (1/2)