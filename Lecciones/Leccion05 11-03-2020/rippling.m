function Y = rippling(A, Ax, Ay)
  % Ax y Ay son las constantes de amplitud
  A = uint8(A);
  
  % Constantes de periodo de ondulacion
  Lx = 75; Ly = 75;
  
  % Nueva imagen
  [m, n, r] = size(A);
  Y = zeros(m, n, r);
  Y = uint8(Y);
  
  for x = 1:m
    for y = 1:n
      xnew = mod(round(x + Ax * sin(2*pi*y / Lx)), m);
      ynew = mod(round(y + Ay * sin(2*pi*x / Ly)), n);
      Y(xnew + 1, ynew + 1, :) = A(x, y, :);
    endfor  
  endfor  
endfunction  