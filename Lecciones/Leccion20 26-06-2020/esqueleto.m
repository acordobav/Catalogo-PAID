function Y = esqueleto(A)
  % A: imagen en formato im2double
  % Y: esqueleto de la imagen A en formato im2double
  A = im2double(A);
  B = strel('diamond',1);
  skeleton = imerode(A,B);
  skeleton_aux = skeleton; % Valor por defecto de la variable auxiliar
  k = 1;
  while 1
    disp(k);
    k = k+1;
    skeleton = imerode(skeleton,B); % Erosion de la imagen
    if (skeleton == 0)
      break;
    endif  
    skeleton_aux = skeleton; % Se actualiza la variable auxiliar
  endwhile
  Y = skeleton_aux;
endfunction
