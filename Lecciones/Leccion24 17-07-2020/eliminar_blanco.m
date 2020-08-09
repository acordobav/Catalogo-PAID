clc; clear; close all;
pkg load image;
A = imread('bordes2-blanco.jpg');
B = imread('cuadro.jpg');
[m,n] = size(B);
A = A(68:801,162:1081,:);
A = imresize(A,[m,n]);
imwrite(A,'bordes.jpg');

imshow(A)