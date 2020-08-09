% Ruido Periodico
clc; clear; close all;
pkg load image

A = imread('sin_ruido.png');
subplot(2,3,1);
imshow(A);
title('Imagen original');

B = imread('periodico_ruido.png');
subplot(2,3,2);
imshow(B);
title('Imagen con ruido periodico');

A_d = im2double(A);
F1 = fft2(A_d);
D1 = fftshift(F1);
subplot(2,3,4);
imshow(log(1+abs(D1)),[]);
title('Frecuencia imagen original');

B_d = im2double(B);
F2 = fft2(B_d);
D2 = fftshift(F2);
subplot(2,3,5);
imshow(log(1+abs(D2)),[]);
title('Frecuencia imagen con ruido periodico')

% Filtrado de la frecuencia

[m,n] = size(D2);
square = ones(5);
j = floor((n+2)/2);
D3 = D2;

% Primer punto con ruido
i1 = 18;
D3(i1-2:i1+2, j-2:j+2) = square;

% Segundo punto con ruido
i2 = 43;
D3(i2-2:i2+2, j-2:j+2) = square;

% Tercer punto con ruido
i3 = 102;
D3(i3-2:i3+2, j-2:j+2) = square;

% Cuarto punto con ruido
i4 = 220;
D3(i4-2:i4+2, j-2:j+2) = square;

% Quinto punto con ruido
i5 = 279;
D3(i5-2:i5+2, j-2:j+2) = square;

% Sexto punto con ruido
i6 = 304;
D3(i6-2:i6+2, j-2:j+2) = square;

subplot(2,3,6);
imshow(log(1+abs(D3)),[]);
title('Frecuencia imagen filtrada')

% Imagen filtrada
I_rec = ifft2(fftshift(D3));
subplot(2,3,3);
I_mos = im2uint8(real(I_rec));
imshow(I_mos);
title('Imagen filtrada');