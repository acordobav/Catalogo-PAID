function Y = binaria(X)
  [m,n] = size(X); 
  Y = zeros(m,n);
  for i = 1:m
    for j = 1:n
      if X(i,j) >= 0.5
        Y(i,j) = 1;
      endif  
    endfor
  endfor
endfunction