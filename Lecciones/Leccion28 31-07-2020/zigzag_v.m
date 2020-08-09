function x = zigzag_v(A)
  % Funcion que implementa el algoritmo ZigZag para codificar una matriz
  % A: Matriz cuadrada de m x m
  % x: Vector con las diagonales diferentes de cero de A
  [m,~]=size(A); % Cantidad de filas y columnas
  n = floor((2*m-1)/2); % Numero de diagonales a partir de la principal
  diags = [flip(-n:n)]; % Diagonales de la matriz A
  s = sum(abs(A)(:));
  x = [];
  for d = diags
    c = m - abs(d); # Cantidad de elementos en la diagonal
    if (d>=0) i = c; j = 1; endif    
    if (d<0) i = m; j = abs(d)+1; endif
    
    % Se obtiene cada elemento de la diagonal uno a la vez
    diag = [];
    for e = 1:c
      diag = [diag A(i,j)];
      i-=1; j+=1;      
    endfor
    
    % Se agrega la diagonal al vector x
    if mod(abs(d),2) == 0 % Es una diagonal par
      % Los valores deben agregarse de arriba hacia abajo,
      % por eso se le hace un flip a la diagonal
      x = [x flip(diag)];
    else % Es una diagonal impar
      x = [x diag]; 
    endif  
    
    % Condicion de parada
    s1 = sum(abs(x));
    if s1 == s
      break;      
    endif
  endfor
endfunction
