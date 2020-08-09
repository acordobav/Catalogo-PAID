function B = comprimir_jpeg(A,c=50)
  % Funcion que implementa el algoritmo JPEG para comprimir una imagen
  % A: imagen a comprimir en formato double con valores en {0,1,...,255}
  %    esta imagen tiene que tener dimensiones multiplos de 8
  % c: Valor de compresion 0 <= c <= 100
  % B: Cell con la matriz codificada
  [m,n] = size(A);
  m = fix(m/8); n = fix(n/8);
  B = cell(m,n);
  % Se divide la imagen en bloques de 8x8
  for i = 1:m
    i_fin = 8*i;
    i_ini = i_fin - 7;
    for j = 1:n
      j_fin = j*8;
      j_ini = j_fin-7;
      bloque = A(i_ini:i_fin,j_ini:j_fin); % Se obtiene un bloque de 8x8
      
      % Paso 1: Restar 128 en cada una de las entradas de la matriz A
      M = bloque-128;
      
      % Paso 2: Calcular la DCT-2D de M
      D = dct2(M);
      
      % Paso 3: Calcular la matriz cuantificada     
      Q = matriz_cuantificacion(c);
      C = round(D./Q);
      
      % Paso 4: Codificacion en vector x
      x = zigzag_v(C);
      B(i,j) = x;
    endfor
  endfor  
endfunction
