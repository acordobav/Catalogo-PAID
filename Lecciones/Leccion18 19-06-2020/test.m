clc; clear; close all;
pkg load image;

g = imread('camarografo_dif.jpg');
g = im2double(g);
[m,n] = size(g);

%{
s = 12;
H = fpb_gaussiano(m,n,s); % Filtro gaussiano paso bajo
%}
d0 = 18;
o = 2;
H = fpb_butterworth(m,n,d0,o);
subplot(1,2,1);
imshow(H);
title('Filtro H');


G = fftshift(fft2(g)); % Transformada DFT-2D de g
subplot(1,2,2);
imshow(log(1+abs(G)), [])
title('Frecuencia imagen original')