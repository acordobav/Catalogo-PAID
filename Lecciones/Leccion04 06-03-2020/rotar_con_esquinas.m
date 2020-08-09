function Y = rotar_con_esquinas(A, angulo)
  % A es la matriz que representa la imagen (8 bytes)
  % Angulo debe estar en grados
  % Y es la imagen rotada
  a0 = cosd(angulo); a1 = sind(angulo); a2 = 0;
  b0 = -sind(angulo); b1 = cosd(angulo); b2 = 0;
  
  % Centro imagen original
  [m, n, r] = size(A);
  xc = round(m / 2); yc = round(n / 2);
  
  % Calculo del desplazamiento que deben tener los pixeles
  % Se redondea porque se trabaja con posiciones enteras
  despl_x = round((sqrt(m ^ 2 + n ^ 2) / 2) - xc);
  despl_y = round((sqrt(m ^ 2 + n ^ 2) / 2) - yc);
  
  Y = zeros(xc + 1, yc + 1, r);
  Y = uint8(Y);
  
  for x = 1:m
    for y = 1:n
      % Se redondea porque se trabaja con posiciones enteras
      xnew = round(a0*(x - xc) + a1 * (y - yc) + xc) + despl_x;
      ynew = round(b0*(x - xc) + b1 * (y - yc) + yc) + despl_y;
      Y(xnew + 1, ynew + 1, :) = A(x, y, :);
    endfor  
  endfor  
endfunction  