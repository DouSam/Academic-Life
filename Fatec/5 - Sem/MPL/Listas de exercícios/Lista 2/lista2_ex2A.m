# Entrada
A = [1 1 1 0 0; 1 -1 0 1 0; -1 1 0 0 1];
b = [6; 4; 4];
c = [-1; -2; 0; 0; 0;];
# Entrada

# Base incial
base = [3 4 5]; # Matriz identidade

do
  # Matriz B
  B = A(:,base);
  
  # Solucao Basica
  xB = inv(B) * b;
  
  # Vetor pT
  pT = c(base)' * inv(B);
  
  # Custo relativo
  s = c' - pT * A;
  
  # Verifica o menor custo
  [m1 p1] = min(s);
  if m1 < 0 
    # Vetor y
    y = inv(B) * A(:,p1);
    
    # Teste da razao
    r = xB ./ y;
    r(r<0)=Inf; # Ignora quem e negativo ou zero
    
    # Verifica a menor razao
    [m2, p2] = min(r);
    if m2 == Inf
      printf("Problema ilimitado");
    else
      # Proxima interacao
      base(p2) = p1;
    endif
  else
    # Matriz com a solu��o otima
    x = zeros(size(c));
    x(base) = xB;

    # Valor otimo
    printf("Valor otimo: %f \n", c' * x * -1);
    
    # Solucao otima
    printf("Solu��o otima:\n x1: %f \n x2: %f \n x3: %f \n x4: %f \n x5: %f \n", x(1), x(2), x(3), x(4), x(5));
  endif
until m1 >= 0 || m2 == inf
