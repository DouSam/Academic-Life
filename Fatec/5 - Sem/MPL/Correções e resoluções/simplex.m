clc

# Dados de entrada
M = 10^5;
A = [3 1 0 0 1 0; 4 3 -1 0 0 1; 1 2 0 1 0 0];
b = [3; 6; 3];
c = [4; 1; 0; 0; M; M];
base = [5 6 4];
d = 1;
k = 1; # contador de iterações
k_max = 100; # máximo de iterações

ZERO = 10^-6;

do
  printf("Iteração %d\n", k)
  base
  B = A(:,base);
  xB = inv(B) * b;
  pT = c(base)'*inv(B);
  s = c' - pT * A;
  [m1 p1] = min(s);
  
  if m1 >= -ZERO
    printf("Solução ótima encontrada\n")
    x = zeros(size(c));
    x(base) = xB
    vo = c' * x * d;
    printf("Valor ótimo = %f\n", vo)
  else
    printf("%d entra na base\n", p1)
    y = inv(B) * A(:, p1);
    r = xB ./ y;
    r(r < -ZERO) = Inf;
    [m2 p2] = min(r);
    
    if m2 != Inf
      printf("%d sai da base\n\n", base(p2))
      base(p2) = p1;
      
    else
      printf("Problema ilimitado\n")
    endif
  endif
  k++;
 until m1 >= -ZERO || m2 == Inf || k > k_max

