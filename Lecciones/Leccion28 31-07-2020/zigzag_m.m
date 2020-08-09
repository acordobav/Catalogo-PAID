function A = zigzag_m(x,m)
  % Funcion que implementa el algoritmo ZigZag para decodificar una matriz
  % x: Vector con las diagonales diferentes de cero de A
  % m: Cantidad de filas y columnas de la matriz A
  % A: Matriz decodificada de m x m
  n = floor((2*m-1)/2); % Numero de diagonales a partir de la principal  
  diags = [flip(-n:n)]; % Diagonales de la matriz A
  s = sum(abs(x));
  A = zeros(m);
  l = 1; % Variable que determina el inicio de cada diagonal en el vector
  for d = diags
    c = m - abs(d); % Cantidad de elementos en la diagonal
    if (d>=0) i = c; j = 1; endif    
    if (d<0) i = m; j = abs(d)+1; endif
    
    elementos = x(l:l+c-1); % Elementos de la diagonal
    
    if mod(abs(d),2) == 0 % Es una diagonal par
      % Los valores de diagonales pares se agregan en la direccion
      % contraria, por eso se le hace un flip a los elementos
      elementos = flip(elementos);
    endif
    
    % Se inserta cada elemento en la matriz
    for e = 1:c
      A(i,j) = elementos(e);
      i-=1; j+=1;      
    endfor
    
    l = l+c; % Se actualiza el limite para la nueva diagonal
    
        % Condicion de parada
    s1 = sum(abs(A)(:));
    if s1 == s
      break;      
    endif
    
  endfor
endfunction