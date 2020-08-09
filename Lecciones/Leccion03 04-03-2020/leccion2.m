clc; clear;
pkg load image;

A = imread('barbara.jpg');

subplot(1, 2, 1);
imshow(A);
subplot(1, 2, 2);
B = rotar(A, 30);
imshow(B);
