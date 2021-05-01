math = require("mathjs");

module.exports =
{
    Converter: function (_base1, _base2, _num) {
        //Definindo o limite do conversor da base 2 até a base 35
        if ((_base1 > 35 || _base2 > 35) || (_base1 < 2 || _base2 < 2)) {
            return;
        }
        return ToBase(FromBase(_num, _base1), _base2);
    }
}

//Tranforma em decimal
function FromBase(_num, _base) {
    let NumDic = { "A": 10, "B": 11, "C": 12, "D": 13, "E": 14, "F": 15, "G": 16, "H": 17, "I": 18, "J": 19, "K": 20, "L": 21, "M": 22, "N": 23, "O": 24, "P": 25, "Q": 26, "R": 27, "S": 28, "T": 29, "U": 30, "V": 31, "W": 32, "X": 33, "Y": 34, "Z": 35 };
    let Num = [];
    let Resultado = 0;
    _num = _num.toString();
    Num = _num.split("").reverse();

    for (i = 0; i < Num.length; i++) {
        //Checa se é um numero
        if (Num[i] * 0 != 0) {
            //Se nao for substitui para seu respectivo valor
            Num[i] = Num[i].toUpperCase()
            Num[i] = NumDic[Num[i]];
        }
        Resultado += Num[i] * math.pow(_base, i);
    }
    return Resultado;
}
//Passa para outra base
function ToBase(_num, _base) {
    let Resultado = [];
    let NumDic = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];

    for (i = 0; i < 32; i++) {
        //Pega o resto da divisão
        let _rest = _num % _base;
        //Divide o numero para saber seu próximo valor
        _num /= _base;
        _num = math.floor(_num);
        //Se o resto for maior que 9 ele tranforma em letra 10=A
        if (_rest > 9) {
            _rest = NumDic[_rest - 10];
        }
        //Adiciona o resto na array
        Resultado[i] = _rest;
        if (!_num) {
            break;
        }
    }
    Resultado.reverse();
    return Resultado.toString().replace(/,/g, "");
}