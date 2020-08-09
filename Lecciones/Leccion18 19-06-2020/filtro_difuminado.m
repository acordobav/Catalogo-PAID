function F = filtro_difuminado(g,H,tol)
  % Filtro para imagenes difuminadas utilizando un filtro paso bajo gaussiano
  % g: imagen difuminada en formato im2double
  % H: filtro gaussiano o butterworth en formato im2double
  % tol: double > 0, tolerancia para el algoritmo de filtrado 
  % F: imagen filtrada en formato im2double
  g = im2double(g);
  [m,n] = size(g);
  G = fftshift(fft2(g)); % Transformada DFT-2D de g
  
  % Filtrado de la imagen difuminada
  F = zeros(m,n);
  for u = 1:m
    for v = 1:n
      if (abs(H(u,v)) >= tol)
        F(u,v) =  G(u,v)/H(u,v);
      else   
        F(u,v) = G(u,v);
      endif
    endfor
  endfor

  % Transformacion al dominio espacial
  F = fftshift(F);
  F = abs(ifft2(F));
endfunction
