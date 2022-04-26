function inputChange(elem) {
    if (!Primo(elem.value)) {
        alert("Número não primo, digite novamente.")
    }

    if (elem.id == "Q" && P == elem.value) {
        alert("Número não pode ser igual ao P.")
    }

    if (elem.id == "Q") {
        Q = elem.value
    }

    if (elem.id == "P") {
        P = elem.value
    }
}

function criptografar(elem) {
    if(!validaEntrada()){
        alert("Verifique se P e Q são primos e distintos. E se o produto deles é maior que 122.");
        return;
    }

    // 2 - Calcular N e Z
    N = P * Q; // modulo que sera passado para a chave publica e privada
    T = (P - 1) * (Q - 1); // totiente  ou fi de Euler

    // 3 - Definir E e calcular D
    E = 43; // Numero maior que 1 e menor que T, primo

    var input = document.getElementById("input").value;
    var output = `P: ${P}<br>
    Q: ${Q}<br>
    N: ${N}<br>
    T: ${T}<br>
    E: ${E}<br>
    D: ${D}<br>
    Texto criptografado: ${Criptografa(input, E, N)}`;
    document.getElementById("output").innerHTML = output;
}

function descriptografar(elem) {
    if(!validaEntrada()){
        alert("Verifique se P e Q são primos e distintos.");
        return;
    }
    
    // 2 - Calcular N e Z
    N = P * Q; // modulo que sera passado para a chave publica e privada
    T = (P - 1) * (Q - 1); // totiente  ou fi de Euler

    // 3 - Definir E e calcular D
    E = 43; // Numero maior que 1 e menor que T, primo
    D = 0; // Inverso multiplicativo modular

    while ((E * D) % T != 1) {
        D++;
    }

    var input = document.getElementById("input").value;
    var output = `P: ${P}<br>
    Q: ${Q}<br>
    N: ${N}<br>
    T: ${T}<br>
    E: ${E}<br>
    D: ${D}<br>
    Texto descriptografado: ${Decriptografa(input, D, N)}`;
    document.getElementById("output").innerHTML = output;
}

function validaEntrada()
{
    var inputP = document.getElementById("P").value;
    var inputQ = document.getElementById("Q").value;

    return Primo(parseInt(inputP)) && Primo(parseInt(inputQ)) && (parseInt(inputQ) * parseInt(inputP) > 122);
}