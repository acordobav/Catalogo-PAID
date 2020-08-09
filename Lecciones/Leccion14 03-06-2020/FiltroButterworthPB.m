%Ejemplo de Filtro Butterworth (Paso Bajo)
clc; clear; close all
pkg load image
X = imread('edificio_china.jpg');
[m,n] = size(X);
subplot(2,3,1)
imshow(X)
title('Imagen Original')
X = im2double(X);

%Calcular DFT-2D
F = fft2(X);
F_shift = fftshift(F);
subplot(2,3,2)
imshow(log(1+abs(F_shift)), [])
title('DFT-2D de la Imagen')

%Calcular el Filtro Butterworth en el Dominio de la Frecuencia
%% 1: Calcular la matriz de distancia
dist = zeros(m,n);
for i = 1:m
  for j = 1:n
    dist(i,j) = sqrt(i^2+j^2);
  endfor
endfor

%% 2: Obtener el Filtro Butterworth
H = zeros(m,n); D0 = 50; n = 2;
H = 1 ./(1+(D0./dist).^(-2*n));

HSI = H(1:floor(m/2), 1:floor(n/2));

HSD = fliplr(HSI);
HID = imrotate(HSI, 180);
HII = fliplr(HID);

[m1, n1] = size(HSI);
H(1:m1, n-n1+1:n) = HSD;
H(m-m1+1:m, n-n1+1:n) = HID;
H(m-m1+1:m, 1:n1) = HII;

subplot(2,3,3);
imshow(H)
title('Filtro Butterworth (No Centrado)')

H_shift = fftshift(H);
subplot(2,3,4);
imshow(H_shift)
title('Filtro Butterworth (Centrado)')

% Aplicar el filtro
DFT2_filt = F.*H;
FM_shift =  fftshift(DFT2_filt);
subplot(2,3,5)
imshow(log(1+abs(FM_shift)), [])
title('DFT-2D de la Imagen con Filtro Butterworth')

%Imagen Filtrada
I_new = abs(ifft2(DFT2_filt));
subplot(2,3,6)
imshow(I_new)
title('Imagen con el Filtro Butterworth');