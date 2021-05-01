var express    = require("express"),
    app        = express(),
    bodyParser = require('body-parser'),
    mongoose   = require("mongoose"),
    methodOverride = require("method-override");

var http = require('http').createServer(app);
var io   = require('socket.io')(http)

mongoose.connect("mongodb://127.0.0.1:27017/contabilidade", { useNewUrlParser: true, useFindAndModify: false });
app.use(bodyParser.urlencoded({ extended: true }));
app.set("view engine", "ejs");
app.use(express.static(__dirname + "/public"));
app.use(methodOverride('_method'));
app.locals.moment = require('moment');

app.use(require("express-session")({
    secret: 'a',
    resave: false,
    saveUninitialized: false
}));

app.use(function (req, res, next) {
    res.locals.currentUser = req.user;
    next();
});

var Conta = require("./models/conta");

app.get('/',(req,res)=>{
    Conta.find({}).sort({ conta: 1 }).exec((err,contas)=>{
        if(err){
            console.log(err);
        }else{
            res.render('inicial', { contas: contas });
        }
    })
})

app.get('/nova',(req,res)=>{
    res.render('nova');
})

app.post('/',(req,res)=>{
    var niveis = req.body.conta.split('.');
    var contaPai = '';
    console.log(niveis)
    for(let i=0;i<(niveis.length)-1;i++){
        contaPai = (i == (niveis.length - 2)) ? contaPai + niveis[i] : contaPai + niveis[i] + ".";
    }
    let conta = {
        conta :req.body.conta,
        nome : req.body.nome,
        contaPai : contaPai
    }
    Conta.create(conta,(err)=>{
        if(err){
            console.log(err);
        }else{
            res.redirect('/');
        }
    })
})

http.listen(27015, () => {
    console.log('listening on 27015');
});