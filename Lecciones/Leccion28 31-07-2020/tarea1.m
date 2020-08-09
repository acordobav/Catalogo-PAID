% Ejemplo de algoritmo JPEG para matrices de 8x8
clc; clear; close all;
pkg load signal;

% ------------------------ Compresion de la imagen

% Paso 0: Imagen en formato double con valores en {0,1,...,255}
A=[154 123 123 123 123 123 123 136;
   192 180 136 154 154 154 136 110;
   254 198 154 154 180 154 123 123;
   239 180 136 180 180 166 123 123;
   180 154 136 167 166 149 136 136;
   128 136 123 136 154 180 198 154;
   123 105 110 149 136 136 180 166;
   110 136 123 123 123 136 154 136];
m = 8;
% Paso 1: Restar 128 en cada una de las entradas de la matriz A
M = A-128;

% Paso 2: Calcular la DCT-2D de M
D = dct2(M);

% Paso 3: Calcular la matriz cuantificada     
Q = matriz_cuantificacion(25);
C = round(D./Q);

% Paso 4: Codificacion en vector x
x = zigzag_v(C);

% ------------------------ Proceso de reconstruccion

%% Obtener la matriz Cr, a partir del vector x
% Paso 1: Decodificar el vector x, a partir del vector x
Cr = zigzag_m(x,m);

% Paso 2: Multiplicar puntualmente la matriz C con la matriz Q
M = Q.*Cr;

% Paso 3: Calcular la inversa de la DCT-2D y redondear
N = round(idct2(M));

% Paso 4: Sumar 128 a cada una de las entradas
Ar = N+128;




     