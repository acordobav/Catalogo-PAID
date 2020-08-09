function Q = matriz_cuantificacion(m)
  Q50=[16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 59 56;
     14 17 22 29 51 87 80 62;
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99]; % Matriz de cuantificacion
  
  if m>50
    Q = floor(((100-m)/50)*Q50);
  elseif m<50 
    Q = floor((50/m)*Q50);
  else
    Q = Q50;
  endif 
endfunction