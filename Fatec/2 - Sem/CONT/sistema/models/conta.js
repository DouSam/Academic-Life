var mongoose = require("mongoose");

var ContaSchema = new mongoose.Schema({
    conta : String,
    contaPai : String,
    nome : String
});


module.exports = mongoose.model("Conta", ContaSchema);