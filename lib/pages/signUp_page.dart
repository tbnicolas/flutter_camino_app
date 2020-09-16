import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
 
class SignUp extends StatefulWidget {
  static final String routeName = 'signUp';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[_crearFondo(context), _signUpForm(context)],
      ),
    );
  }

   Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoAzul = new Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: <Color>[
        Color.fromRGBO(52, 54, 101, 1.0),
        Color.fromRGBO(35, 37, 57, 1.0),
      ])),
    );

    final imageBackground = new Column(
     //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: double.infinity, height:size.height*0.05),
        new Image.asset(
          "assets/images/logo2.png",
          width: 350,
        ),
       
      ],
    );
    return new Stack(
      children: <Widget>[
        fondoAzul,
       imageBackground
      ],
    );
  } 

  Widget _signUpForm(BuildContext context) {
    final userName = new Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: new Container(
        color: Color(0xfff5f5f5),
        child: new TextField(
          style: TextStyle(color: Colors.black),
          decoration: new InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Usuario',
              prefixIcon: Icon(Icons.person_outline),
              labelStyle: TextStyle(fontSize: 15)),
        ),
      ),
    );
    final password = new Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: new Container(
        color: Color(0xfff5f5f5),
        child: new TextField(
          style: TextStyle(color: Colors.black),
          decoration: new InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Contraseña',
              prefixIcon: Icon(Icons.lock_outline),
              labelStyle: TextStyle(fontSize: 15)),
        ),
      ),
    );
    final loginText = new BounceInLeft(
      delay: new Duration(milliseconds: 500),
      child: new Text(
        'SignUp',
        style: new TextStyle(
            color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold, ),
      ),
    );

    final button = new Padding(
      padding: EdgeInsets.only(top: 20),
      child: MaterialButton(
        onPressed: () => print("Hola!"), //since this is only a UI app
        child: Text(
          'SIGN IN',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Color(0xffff2d55),
        elevation: 0,
        minWidth: 400,
        height: 50,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    final forgotPassword = new Padding(
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: Text(
          '¿Olvidaste tu contraseña?',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final sigUpLink = new Padding(
        padding: EdgeInsets.only(top: 30),
        child: Center(
            child: new GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
              child: RichText(
                  text: TextSpan(children: [
          TextSpan(
                text: "Tienes cuenta?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                )),
          TextSpan(
                text: "Inicia sesión",
                style: TextStyle(
                  color: Color(0xffff2d55),
                  fontSize: 15,
                ))
        ])),
            )));

    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 270),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: new ListView(
            children: <Widget>[
              loginText,
              new SizedBox(
                height: 25,
              ),
              userName,
              password,
              button,
              forgotPassword,
              sigUpLink
            ],
          )),
    );
  }
} 