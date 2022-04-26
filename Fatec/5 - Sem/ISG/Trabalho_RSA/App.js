var express    = require("express"),
    app        = express();

var http = require('http').createServer(app);

app.set("view engine", "ejs");
app.use(express.static(__dirname + "/public"));

app.get("/",(req,res)=>{
    res.render("index.ejs")
})

http.listen(80, () => {
    console.log("Porta 80");
});