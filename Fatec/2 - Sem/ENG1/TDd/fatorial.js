function fatorial(num){
    if (num > 1) {
        return num * fatorial(num - 1)
    }
    return num 
}

module.exports = fatorial;