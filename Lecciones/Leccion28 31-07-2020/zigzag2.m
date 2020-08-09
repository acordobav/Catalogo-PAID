function x = zigzag2(A)
  % Funcion que implementa el algoritmo ZigZag para codificar una matriz
  % A: Matriz cuadrada de m x m
  % x: Vector con las diagonales diferentes de cero de A
  [m,~]=size(A);
  A = flip(A,2); % Se invierte para utilizar el comando diag()
  n = floor((2*m-1)/2); % Numero de diagonales a partir de la principal
  diags = [flip(-n:n)]; % Diagonales de la matriz A
  
  s = sum(abs(A)(:));
  x = [];
  for i = diags
    % Condicion de parada
    s1 = sum(abs(x));
    if s1 == s
      break;      
    endif
    
    d = diag(A,i)';
    if mod(length(d),2) == 0 % Es una diagonal par
      x = [x d];
    else % Es una diagonal impar
      % Los valores deben agregarse de abajo hacia arriba,
      % por eso se le hace un flip a la diagonal
      x = [x flip(d)]; 
    endif
  endfor
endfunction
