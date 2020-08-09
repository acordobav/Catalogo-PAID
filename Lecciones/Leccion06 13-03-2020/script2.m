clc; clear;

A = imread('boat_new.jpg');
subplot(1, 3, 1);
imshow(A);
title('Imagen Original');

L = 255;
rmax = max(max(A));
rmin = min(min(A));
A = (L - 1) / (rmax - rmin) * (A - rmin);

subplot(1, 3, 2);
imshow(A);
title('Imagen con Autocontraste');

A = imread('boat.jpg');
subplot(1, 3, 3);
imshow(A);
title('Imagen sin modificar');
