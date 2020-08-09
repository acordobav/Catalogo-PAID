function Y = filtro_promedio(A, r)
  % A: imagen original en formato im2double
  % r: double con el radio de la ventana sin contar el centro
  [m,n] = size(A);
  Y = zeros(m,n);
  
  for i = 1:m
    for j = 1:n
      % Calculo de los limites de la ventana actual
      sup = i - r; % Limite superior
      inf = i + r;  % Limite inferior
      izq = j - r; % Limite izquierdo
      der = j + r; % Limite derecho      
      
      % Comprobacion que los limites no sobrepasen 
      % las dimensiones de la imagen original
      if(sup < 1) sup = 1; endif
      if(inf > m) inf = m; endif
      if(izq < 1) izq = 1; endif
      if(der > n) der = n; endif

      % Calculo del promedio
      Y(i,j) = mean(mean(A(sup:inf, izq:der)));
    endfor  
  endfor  
endfunction
