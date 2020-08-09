function Y = promedio(A)
  A = im2double(A);
  [m, n, r] = size(A);
  
  % Vector con los tres canales en cero
  cero = zeros(1, 1, 3); 
  
  for i = 1:m
    for j = 1:n
      % Se calcula el promedio en aquellos casos
      % donde los tres canales son cero
      if (A(i, j, :) == cero)
        vecindario = [];
        
        i_ant = i - 1;
        i_sig = i + 1;
        j_ant = j - 1;
        j_sig = j + 1;
        
        % Verificacion columna izquierda
        if(j_ant != 0)
          % Verificacion fila anterior
          if (i_ant != 0)
            vecindario = [vecindario A(i_ant, j_ant, :)];
          end
          % Verificacion fila siguiente
          if(i_sig != m+1)
            vecindario = [vecindario A(i_sig, j_ant, :)];
          end
          % Caso fila actual
          vecindario = [vecindario A(i, j_ant, :)];
        endif
        
        % Verificacion columna derecha
        if(j_sig != n+1)
          % Verificacion fila anterior
          if (i_ant != 0)
            vecindario = [vecindario A(i_ant, j_sig, :)];
          end
          % Verificacion fila siguiente
          if(i_sig != m+1)
            vecindario = [vecindario A(i_sig, j_sig, :)];    
          end
          % Caso fila actual
          vecindario = [vecindario A(i, j_sig, :)];
        endif     
        
        A(i, j, :) = mean(vecindario);
      end
    end
  end
  Y = A;
endfunction