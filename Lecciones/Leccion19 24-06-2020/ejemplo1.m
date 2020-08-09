clc; clear; close all;
pkg load image;

A = imread('imagen2.jpg');
A = im2double(A);
A = binaria(A);
subplot(2,3,1);
imshow(A);
title('Imagen A');

B = imread('imagen3.jpg');
B = im2double(B);
B = binaria(B);
subplot(2,3,2);
imshow(B);
title('Imagen B')

subplot(2,3,3);
imshow(A&B);
title('A \cap B');

subplot(2,3,4);
imshow(A|B);
title('A \cup B');

subplot(2,3,5);
imshow(~A);
title('A^c');

subplot(2,3,6);
imshow(A|~B);
title('A-B');