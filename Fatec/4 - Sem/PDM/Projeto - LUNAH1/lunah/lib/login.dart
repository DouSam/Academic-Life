import 'package:flutter/material.dart';
import 'package:lunah/user.dart' as user;
class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isChecked = false;
  var formKey = GlobalKey<FormState>();

  Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.green;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Form(
          child: Column(
            children: [
              Image.asset('lib/images/logo.png',
                width: MediaQuery.of(context).size.width *0.60,
              ),
              //Text("LUNAH", style: Theme.of(context).textTheme.headline1,),
              campo("E-mail", txtEmail, TextInputType.emailAddress, "example@example.com",Icon(Icons.email_outlined),false),
              campo("Senha", txtSenha, TextInputType.visiblePassword, "p@Ssw0rd",Icon(Icons.password_rounded),true),
              Row(
                children: [
                  Container(
                    child: Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    padding: EdgeInsets.only(left: 50, bottom: 10, top: 10),
                  ),
                  Text(
                    "Acessar automaticamente.",
                    style: Theme.of(context).textTheme.subtitle1,  
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: (){
                    user.actualUser = user.User(txtEmail.text,txtSenha.text);
                    Navigator.pushNamed(context, "menu");
                    //txtEmail.dispose();
                    //txtSenha.dispose();
                  },
                  child: Text("Acessar"), 
                ),
                width: MediaQuery.of(context).size.width *0.60,
                height: 50,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          key: formKey,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("LUNAH"),
        centerTitle: true,
      ),
    );
  }

  Widget campo(rotulo, fieldControler, fieldType, fieldHint, fieldIcon,fieldObs){
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
      child: TextFormField(
        keyboardType: fieldType,
        controller: fieldControler,
        style: Theme.of(context).textTheme.headline1,
        obscureText: fieldObs,
        decoration: InputDecoration(
          icon: fieldIcon,
          labelText: rotulo,
          labelStyle: Theme.of(context).textTheme.headline2,
          hintText: fieldHint,
          hintStyle: Theme.of(context).textTheme.headline3,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).focusColor,
            ),
            borderRadius: BorderRadius.circular(10),  
          ),
        ),
      ),
    );
  }
}

