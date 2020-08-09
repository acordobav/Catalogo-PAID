clc; clear; close all;

x = imread('camarografo_dif.jpg');
x = im2double(x);
[m,n] = size(x);

tol = 0.05;

s = 12;
H1 = fpb_gaussiano(m,n,s); % Filtro gaussiano paso bajo
F1 = filtro_difuminado(x,H1,tol);


d0 = 18;
o = 2;
H2 = fpb_butterworth(m,n,d0,o);
F2 = filtro_difuminado(x,H2,tol);

subplot(1,3,1);
imshow(x);
title('Imagen Original')

subplot(1,3,2);
imshow(F1);
title('Imagen filtrada - Gaussiano');

subplot(1,3,3);
imshow(F2);
title('Imagen filtrada - Butterworth');
