// 1 - Definir P e Q
console.log("Quanto maior o valor de P(17) e Q(41), mais tempo demora para quebrar a chave privada.");
var P = 17//parseInt(prompt("Defina o valor de P"));
  
  // Verifica se P e primo
if(!Primo(P)){
  while(!Primo(P))
    {
      console.log("Número não primo, digite novamente.");
      P = parseInt(prompt("P:"));
    }
}

var Q = 71//parseInt(prompt("Defina o valor de Q"));
  
  // Verifica se Q e primo
if(!Primo(Q) || Q == P || Q * P < 122){
  while(!Primo(Q) || Q == P || Q * P < 122)
    {
      console.log("Número não primo ou igual a P, digite novamente.");
	  console.log("Verifique também se o produto de P e Q é maior que 122");
      Q = parseInt(prompt("Q:"));
    }
}

// 2 - Calcular N e Z
var N = P * Q; // modulo que sera passado para a chave publica e privada
var T = (P - 1) * (Q - 1); // totiente  ou fi de Euler

// 3 - Definir E e calcular D
var E = 43; // Numero maior que 1 e menor que T, primo
var D = 0; // Inverso multiplicativo modular

while((E * D) % T != 1)
{
  D++;
}

console.log("\tP: ", P);
console.log("\tQ: ", Q);
console.log("\tN: ", N);
console.log("\tT: ", T);
console.log("\tE: ", E);
console.log("\tD: ", D);

console.log("Chave Pública: (" + E + "," + N + ")");

console.log("Chave Privada: (" + D + "," + N + ")");

// Criar rotina para criptografar
var entrada = "FATEC 10"//prompt("Insira o texto a ser criptografado");
var tCriptografado = Criptografa(entrada, E, N);
console.log("Texto criptografado: ", tCriptografado);

// Criar rotina para decriptografar
console.log("\n--------------------------\n")
var tDecriptografado = Decriptografa(tCriptografado, D, N);
console.log("Texto criptografado: ", tDecriptografado);

function Criptografa(entrada, E, N)
{
  console.log("Texto de entrada: ", entrada);

  var entrada = Array.from(entrada); // Separa os caracteres da entrada
  var temp = ""; // Variavel para armazenar o texto criptografado
  
  entrada.forEach((letra)=>{ // Percorrendo cada letra
    var letraAscii = letra.charCodeAt(0); // Obtendo o codigo ASCII da letra, poderia ser qualquer outra forma
    console.log("\t\tASCII: ", letraAscii, "(" + letra + ")");
    var letraAsciiC = cdn(letraAscii, E, N); // Calculando seu valor criptografado
	letraAsciiC = letraAsciiC.toString();
    // Formatando para garantir que os 0's sejam considerados.
    while(letraAsciiC.length < N.toString().length){
      letraAsciiC = "0" + letraAsciiC;
    }
    console.log("\t\tASCII Criptografado: ", letraAsciiC);
    temp += letraAsciiC; // Inserindo o valor criptografado no array
  })
  
  return temp;
}

function Decriptografa(entrada, D, N)
{
  var temp = ""; // Variavel para armazenar o texto decriptografado
  /*
  // Existe uma propriedade matematica que indica que o tamanho
  // do texto criptografado é menor que o tamanho de N então
  // podemos 'picar' a entrada pelo tamanho de N
  */
  var entrada = splitToSubstrings(entrada, N.toString().length);  // Blocos criptografados das letras
  entrada.forEach((letra)=>{ // Percorrendo cada bloco
	console.log("Texto criptogtafado: ", letra);
	letra = parseInt(letra);
    let letraAsciiD = cdn(letra, D, N); // Realizando a decriptografia
    console.log("ASCII Decriptografada: ", letraAsciiD);
    let letraAscii = String.fromCharCode(letraAsciiD); // Convertendo para Char pela tabela ASCII
    console.log("\t\tASCII: ", letraAscii);
    temp += letraAscii; // Adicionando a variavel temporaria
  })
  
  return temp;  
}

function Primo(n) {
  for(i = n-1; i != 1; i--)
    {
      if(n % i == 0){
        return false;
      }
    }
  return true;
}

function splitToSubstrings(str, n) {
  const arr = [];

  for (let index = 0; index < str.length; index += n) {
    arr.push(str.slice(index, index + n));
  }

  return arr;
}

function Pow(base, expo)
{
	if(expo == 1)
	{
		return base;
	}
	return base * Pow(base, expo-1);
}

function cdn(c, d, n)      // work out c^d mod n
{
  var value = 1;
  while (d > 0) {
    value *= c;
    value %= n;
    d--;
  }
  return value;
}