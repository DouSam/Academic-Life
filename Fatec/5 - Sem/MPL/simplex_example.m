clc
# Entrada
A = [1 1 1 0 0; 3 1 0 1 0; -1 3 0 0 1];
b = [5; 12; 7];
c = [-2; -4; 0; 0; 0;];
contador = 1;
minP = -1; # -1 se o problema foi passado para forma padrao 1 se ja estava em forma padrao

# Base incial
base = [3 4 5] # Matriz identidade

# Definindo zero
ZERO = 10^-6;

do

  printf("Iteracao %d\n", contador);

  # Matriz B
  B = A(:,base)

  # Solucao Basica
  printf("Solucao Basica\n");
  xB = inv(B) * b

  # Vetor pT
  pT = c(base)' * inv(B);

  # Custo relativo
  printf("Custo relativo\n");
  s = c' - pT * A

  # Verifica o menor custo
  [m1 p1] = min(s);
  if m1 < -ZERO
    # Vetor y
    y = inv(B) * A(:,p1);

    # Teste da razao
    r = xB ./ y;
	printf("Teste da razao\n");
    r(r < -ZERO) = Inf # Ignora quem e negativo ou zero

    # Verifica a menor razao
    [m2, p2] = min(r);
    if m2 == Inf
      printf("Problema ilimitado");
    else
      # Proxima interacao
      base(p2) = p1
    endif
  else
    # Matriz com a solucao otima
    x = zeros(size(c));
    x(base) = xB;

    # Valor otimo
    printf("Valor otimo: %f \n", c' * x * minP);

    # Solucao otima
    printf("Solucao otima:\n" );
    for i = 1:length(x)
      printf(" x%d: %f \n", i, x(i));
    endfor
  endif

  contador++;
until m1 >= -ZERO || m2 == inf || contador > 200
