% Ejemplo de algoritmo JPEG para matrices de 8x8
clc; clear; close all;
pkg load signal;

% Compresion de la imagen

% Paso 0: Imaagen en formato double con valores en {0,1,...,255}
A=[154 123 123 123 123 123 123 136;
   192 180 136 154 154 154 136 110;
   254 198 154 154 180 154 123 123;
   239 180 136 180 180 166 123 123;
   180 154 136 167 166 149 136 136;
   128 136 123 136 154 180 198 154;
   123 105 110 149 136 136 180 166;
   110 136 123 123 123 136 154 136];

% Paso 1: Restar 128 en cada una de las entradas de la matriz A
M = A-128;

% Paso 2: Calcular la DCT-2D de M
D = dct2(M);

% Paso 3: Calcular la matriz cuantificada     
Q = matriz_cuantificacion(25);
C = round(D./Q);

% Paso 4: Codificacion en vector x
m = 8;
x = [C(1,1)]; s = sum(sum(abs(C)));

for i = 2:m % Recorrer las primeras m diagonales de C
  for j = 1:i % Recorrer los valores de cada una de las diagonales
    if mod(i,2) == 0 % Es una diagonal par?
      x = [x C(j,i-j+1)];
    else % Es una diagonal impar
      x = [x C(i-j+1,j)];
    end  
  end
  if sum(abs(x)) == s;
    break;
  end  
end 

%%% Tarea: Falta analizar y obtener los valores de las diagonales 
%%% que se encuentran despues de las primeras m diagonales de C



% Proceso de reconstruccion

%% Obtener la matriz Cr, a partir del vector x
% Paso 1: Decodificar el vector x, a partir del vector x

Cr = zeros(m); k = 1; Cr(1,1) = x(k); t = length(x);

for i = 2:m % Recorrer las primeras m diagonales de Cr
  for j = 1:i % Recorrer los valores de cada una de las diagonales
    k = k+1;
    if mod(i,2) == 0 % Es una diagonal par?
      Cr(j,i-j+1) = x(k);
    else % Es una diagonal impar
      Cr(i-j+1,j) = x(k);
    end  
  end
  if t == k
    break;
  end  
end 

%%% Tarea: Falta analizar y obtener los valores de las diagonales 
%%% que se encuentran despues de las primeras m diagonales de C

% Paso 2: Multiplicar puntualmente la matriz C con la matriz Q
M = Q.*Cr;

% Paso 3: Calcular la inversa de la DCT-2D y redondear
N = round(idct2(M));

% Paso 4: Sumar 128 a cada una de las entradas
Ar = N+128;




     