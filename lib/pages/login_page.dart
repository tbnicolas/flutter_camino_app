import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_camino_app/blocs/login_bloc.dart';
import 'package:flutter_camino_app/blocs/providers.dart';
import 'package:flutter_camino_app/pages/home_page.dart';
import 'package:flutter_camino_app/pages/signUp_page.dart';
import 'package:flutter_camino_app/providers/firebaseUser_providers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_camino_app/utils/sizeConfig_utils.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final firebaseUserProvider = new FirebaseUserProvider();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[_crearFondo(context), _loginForm(context)],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('Size fONDO: ${size.height * 0.4}');
    final fondoAzul = new Container(
      height: 40 * SizeConfig.heightMultiplier,
      width: double.infinity,
      decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: <Color>[
        Color.fromRGBO(52, 54, 101, 1.0),
        Color.fromRGBO(35, 37, 57, 1.0),
      ])),
    );

    final imageBackground = new Container(
      padding: EdgeInsets.only(right: 2.5 * SizeConfig.widthMultiplier),
      child:Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: double.infinity, height: 7 * SizeConfig.heightMultiplier),
        new Image.asset(
          "assets/images/logo2.png",
          fit: BoxFit.fill,
        ),
      ],
    ));
    return new Stack(
      children: <Widget>[fondoAzul, imageBackground],
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final loginText = new Text(
        'Login',
        style: new TextStyle(
          color: Colors.black,
          fontSize: 8.33333333333 * SizeConfig.widthMultiplier,
          fontWeight: FontWeight.bold,
        ),
      );

    final forgotPassword = new Padding(
      padding: EdgeInsets.only(top: 2.13068181818 * SizeConfig.heightMultiplier),
      child: Center(
        child: Text(
          '¿Olvidaste tu contraseña?',
          style: TextStyle(fontSize: 3.125 * SizeConfig.widthMultiplier, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final sigUpLink = new Padding(
        padding: EdgeInsets.only(top: 3.19602272727 * SizeConfig.heightMultiplier),
        child: Center(
            child: new GestureDetector(
          onTap: () =>
              Navigator.pushReplacementNamed(context, SignUp.routeName),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "No tienes cuenta?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 3.125 * SizeConfig.widthMultiplier,
                )),
            TextSpan(
                text: "Registrate",
                style: TextStyle(
                  color: Color(0xffff2d55),
                  fontSize: 3.125 * SizeConfig.widthMultiplier,
                ))
          ])),
        )));

    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 37.2869318182 * SizeConfig.heightMultiplier),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 4.79166666667 * SizeConfig.widthMultiplier,
            vertical: 2.66335227273 * SizeConfig.heightMultiplier
          ),
          child: new ListView(
            children: <Widget>[
              loginText,
              new SizedBox(
                height: 2.66335227273 * SizeConfig.heightMultiplier,
              ),
              _crearEmail(bloc),
              _crearPassword(bloc),
              _crearBoton(bloc),
              forgotPassword,
              sigUpLink
            ],
          )),
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return new StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return new Padding(
              padding: EdgeInsets.fromLTRB(0, 2.13068181818 * SizeConfig.heightMultiplier, 0, 2.13068181818 * SizeConfig.heightMultiplier),
              child: new Container(
                color: Colors.white,
                child: new TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'ejemplo@correo.com',
                      labelText: 'Correo electronico',
                      //counterText: snapshot.data,
                      errorText: snapshot.error,
                      prefixIcon: Icon(Icons.person_outline),
                      labelStyle: TextStyle(fontSize: 3.125 * SizeConfig.widthMultiplier)),
                  onChanged: bloc.changeEmail,
                ),
              ));
        });
  }

  Widget _crearPassword(LoginBloc bloc) {
    return new StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return new Padding(
           padding: EdgeInsets.fromLTRB(0, 2.13068181818 * SizeConfig.heightMultiplier, 0, 2.13068181818 * SizeConfig.heightMultiplier),
              child: new Container(
                color: Color(0xfff5f5f5),
                child: new TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                      prefixIcon: Icon(Icons.lock_outline),
                      labelStyle: TextStyle(fontSize: 3.125 * SizeConfig.widthMultiplier)),
                  onChanged: bloc.changePassword,
                ),
              ));
        });
  }

  Widget _crearBoton(LoginBloc bloc) {
    return new StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return new Padding(
              padding: EdgeInsets.only(top: 2.13068181818 * SizeConfig.heightMultiplier),
              child: new ButtonTheme(
                minWidth: 83.3333333333 * SizeConfig.widthMultiplier,
                height: 5.32670454545 * SizeConfig.heightMultiplier,
                child: new RaisedButton(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                      fontSize: 3.125 * SizeConfig.widthMultiplier,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Color(0xffff2d55),
                  elevation: 0,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: snapshot.hasData ? () => _login(bloc, context) : null,  
                ),
              )
         );
        });
  }

  _login (LoginBloc bloc, BuildContext context) async{
    try {
      final user = await firebaseUserProvider.signInWithCredentials(bloc.email, bloc.password);
      
      if (user != null) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      }else{
        print('Entro Aqui');
        Fluttertoast.showToast(msg: 'No se pudo realizar la operacion');
      }  
    } catch (e) {
        print('Entro Aqui2: $e');
        Fluttertoast.showToast(msg: 'No se pudo realizar la operacion');
    }
  }
}
