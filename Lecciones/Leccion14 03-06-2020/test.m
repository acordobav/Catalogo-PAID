% Ejemplo Filtro Ideal (Paso Bajo)
clc; clear; close all;
X = imread('edificio_china.jpg');
subplot(2, 3, 1);
imshow(X);
title('Imagen Original');
X = im2double(X);

% Calcular DFT-2D de la imagen
F = fft2(X);
F_shift = fftshift(F);
subplot(2, 3, 2);
imshow(log(1+abs(F_shift)), []);
title('DFT-2D de la Imagen');

% Calcular el Filtro Ideal en el Dominio de la Frecuencia
% 1. Calcular la matriz de distancia
[m, n] = size(X); dist = zeros(m, n);
m1 = floor(m/2); n1 = floor(n/2);
for i = 1:m
  for j = 1:n
    dist(i, j) = sqrt((i-m1)^2 + (j-n1)^2);
  endfor
endfor
% 2. Obtener el Filtro Ideal
H = zeros(m, n); D0 = 50; ind = (dist<=D0); H(ind) = 1;

%%%% Este filtro H, solo tiene una cuarta parte del total
%%%% Tarea: completar el filtro H, de tal manera, que en el
%%%% centro se vea el circulo
subplot(2, 3, 3);
H_nc = fftshift(H);
imshow(H_nc);
title('Filtro Ideal (No centrado)')

subplot(2, 3, 4);
imshow(H);
title('Filtro Ideal (Centrado)')

% Aplicar el filtro
DFT2_filt = F.*H_nc;
FM_shift = fftshift(DFT2_filt);
subplot(2, 3, 5);
imshow(log(1+abs(FM_shift)), [])
title('DFT-2D de la Imagen con el Filtro Ideal')

% Imagen filtrada
I_new = real(ifft2(DFT2_filt));
subplot(2, 3, 6);
imshow(I_new);
title('Imagen con el Filtro Ideal');
