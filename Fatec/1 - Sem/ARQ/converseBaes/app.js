var express = require("express"),
    app     = express();

var Converter = require('./Public/scripts/conversorDebases.js')

app.set("view engine", "ejs");
app.use(express.static(__dirname + "/public"));

app.get('/',(req,res)=>{
    var numero = 0;
    console.log(req.query)
    if(req.query.numero == undefined || parseInt(req.query.numero) == 0){
        res.render('index', { numero: numero })
    }else{
        numero = Converter.Converter(parseInt(req.query.base1), parseInt(req.query.base2),req.query.numero)
        console.log(numero)
        res.render("index",{numero:numero})
    }
})

app.listen(5050,()=>{
    console.log("Executando na porta 5050")
})