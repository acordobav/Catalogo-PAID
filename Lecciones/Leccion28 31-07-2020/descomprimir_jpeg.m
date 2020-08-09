function A = descomprimir_jpeg(B,c=50)
  % Funcion que implementa el algoritmo JPEG para descomprimir una imagen
  % B: Cell con la matriz codificada
  % c: Valor de compresion 0 <= c <= 100
  % A: imagen descomprimida en formato double con valores en {0,1,...,255}
  [m,n] = size(B);
  A = zeros(m*8,n*8);
  % Se obtienen los vectores comprimidos de los bloques de 8x8
  for i = 1:m
    i_fin = 8*i;
    i_ini = i_fin - 7;
    for j = 1:n
      j_fin = j*8;
      j_ini = j_fin-7;
      x = B{i,j};
      
      % Paso 1: Decodificar el vector x
      Cr = zigzag_m(x,8);
      
      % Paso 2: Multiplicar puntualmente la matriz C con la matriz Q
      Q = matriz_cuantificacion(c);
      M = Q.*Cr;
      
      % Paso 3: Calcular la inversa de la DCT-2D y redondear
      N = round(idct2(M));
      
      % Paso 4: Sumar 128 a cada una de las entradas
      Ar = N+128;
      
      A(i_ini:i_fin,j_ini:j_fin) = Ar; % Se guarda el bloque de 8x8
    endfor
  endfor
endfunction
