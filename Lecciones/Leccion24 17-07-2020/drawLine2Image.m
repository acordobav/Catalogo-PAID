function Y = drawLine2Image(A,x1,x2,y1,y2,color=255,l=1);
  % A: Matriz en formato uint8 de la imagen
  % x1: Double, valor en el eje 'x' del punto inicial
  % x2: Double, valor en el eje 'x' del punto final
  % y1: Double, valor en el eje 'y' del punto inicial
  % y2: Double, valor en el eje 'y' del punto final
  % color: vector con el valor RGB 8 bits para la linea, [R G B].
  %        si se ingresa solo un valor lo tomara como escala de grises
  % l: Double, grosor de la linea
  % Y: Imagen A con la linea superpuesta, formato uint8
  [m,n,r] = size(A);
  [~,r1] = size(color);  
  nPoints = max(abs(x2-x1), abs(y2-y1))+1; % Numero de puntos en la linea
  yIndex = round(linspace(y1, y2, nPoints)); % Indices en el eje y 
  xIndex = round(linspace(x1, x2, nPoints)); % Indices en el eje x
  index = sub2ind(size(A), yIndex, xIndex); % Indices que deben ser modificados
  % Matriz logica para modificar los indices en la imagen A
  I = zeros(m,n);
  I(index) = 1;
  I = logical(I);
  
  % Dilatacion para aumentar el grosor de la linea
  if(l > 1)
    SE = strel('square',l); % Elemento estructurado
    I = imdilate(I,SE); % Dilatacion de I con E  
  endif
  
  % Si la linea es a color y la imagen A es en escala de grises
  % se aumenta el numero de canales de A a 3
  if r == 1 & r1 == 3;
    A = cat(3,A,A,A);
  endif  

  % Se modifica cada canal de la imagen con el valor de la linea
  for i = 1:r1
    channel = A(:,:,i);
    channel(I) = color(i);
    Y(:,:,i) = channel;
  endfor
  Y = uint8(Y);
  % https://stackoverflow.com/questions/2464637/
  % matlab-drawing-a-line-over-a-black-and-white-image/14308558#14308558
endfunction
