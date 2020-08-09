close all;

[m,n] = size(D2);
square = ones(5);
j = floor((n+2)/2);
D3 = D2;

% Primer punto con ruido
i1 = 18;
D3(i1-2:i1+2, j-2:j+2) = square;

% Segundo punto con ruido
i2 = 43;
D3(i2-2:i2+2, j-2:j+2) = square;

% Tercer punto con ruido
i3 = 102;
D3(i3-2:i3+2, j-2:j+2) = square;

% Cuarto punto con ruido
i4 = 220;
D3(i4-2:i4+2, j-2:j+2) = square;

% Quinto punto con ruido
i5 = 279
D3(i5-2:i5+2, j-2:j+2) = square;

% Sexto punto con ruido
i6 = 304;
D3(i6-2:i6+2, j-2:j+2) = square;

imshow(log(1+abs(D3)),[]);