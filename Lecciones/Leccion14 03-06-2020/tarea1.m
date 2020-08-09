pkg load image;

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
for i = 1:m
  for j = 1:n
    dist(i, j) = sqrt(i^2 + j^2);
  endfor
endfor
% 2. Obtener el Filtro Ideal
H = zeros(m, n); D0 = 50; ind = (dist<=D0); H(ind) = 1;

% Se obtiene el cuadrante donde se encuentra la cuarta parte del total
H_aux = H(1:floor(m/2), 1:floor(n/2));
H_sup_der = fliplr(H_aux); % Esquina superior derecha
% Se rota la imagen H_aux 180 grados para obtener la esquina inferior derecha
H_inf_der = imrotate(H_aux, 180); % Esquina inferior derecha
H_inf_izq = fliplr(H_inf_der); % Esquina inferior izquierda

[m1, n1] = size(H_aux);
H(1:m1, n-n1+1:n) = H_sup_der;
H(m-m1+1:m, n-n1+1:n) = H_inf_der;
H(m-m1+1:m, 1:n1) = H_inf_izq;

subplot(2, 3, 3);
imshow(H);
title('Filtro Ideal (No centrado)')

subplot(2, 3, 4);
imshow(fftshift(H));
title('Filtro Ideal (Centrado)')


% Aplicar el filtro
DFT2_filt = F.*H;
FM_shift = fftshift(DFT2_filt);
subplot(2, 3, 5);
imshow(log(1+abs(FM_shift)), [])
title('DFT-2D de la Imagen con el Filtro Ideal')

% Imagen filtrada
I_new = real(ifft2(DFT2_filt));
subplot(2, 3, 6);
imshow(I_new);
title('Imagen con el Filtro Ideal');
