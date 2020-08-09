clc; clear; close all;

x = imread('camarografo_dif.jpg');
x = im2double(x);
[m,n] = size(x);

k = 0.1;

s = 12;
H1 = fpb_gaussiano(m,n,s); % Filtro gaussiano paso bajo
F1 = filtro_wiener(x,H1,k);

%{
d0 = 18;
o = 2;
H2 = fpb_butterworth(m,n,d0,o);
F2 = filtro_wiener(x,H2,k);
%}

subplot(1,2,1);
imshow(x);
title('Imagen Original')

subplot(1,2,2);
imshow(F1);
title('Imagen filtrada - Gaussiano');
%{
subplot(1,3,3);
imshow(F2);
title('Imagen filtrada - Butterworth');
%}

