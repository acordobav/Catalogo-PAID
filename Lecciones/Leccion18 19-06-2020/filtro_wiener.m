function F = filtro_wiener(g,H,k)
  % Filtro para imagenes difuminadas utilizando un filtro paso bajo gaussiano
  % g: imagen difuminada en formato im2double
  % H: filtro gaussiano o butterworth en formato im2double
  % k: double que aproxima la cantidad de ruido
  % F: imagen filtrada en formato im2double
  g = im2double(g);
  [m,n] = size(g);
  G = fftshift(fft2(g)); % Transformada DFT-2D de g
  
  % Filtrado de la imagen difuminada
  %F = ((1./H).*((abs(H).^2)./(abs(H).^2+k))).*(abs(G).^2);
  
  F = zeros(m,n);
  for u = 1:m
    for v = 1:n
      H_uv = H(u,v);
      G_uv = G(u,v);
      F(u,v) = ((1/H_uv)*((abs(H_uv)^2)/((abs(H_uv)^2)+k)))*(G_uv);
    endfor
  endfor
  
  % Transformacion al dominio espacial
  F = fftshift(F);
  F = abs(ifft2(F));
endfunction