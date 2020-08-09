function Y = dilatacion(A,r)
  % Funcion que implementa la operacion morfologica de
  % dilatacion en una imagen en escala de grises
  % A: imagen original en formato im2double
  % r: double con el radio de la ventana sin contar el centro
  % Y: imagen dilatada en formato im2double
  [m,n] = size(A);
  Y = uint8(zeros(m,n));
  
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

      % Calculo del maximo
      v = A(sup:inf, izq:der)(:);
      Y(i,j) = max(v);
    endfor  
  endfor  
endfunction
