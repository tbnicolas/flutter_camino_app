import 'package:flutter/material.dart';
import 'package:flutter_camino_app/blocs/providers.dart';
import 'package:flutter_camino_app/pages/login_page.dart';
import 'package:flutter_camino_app/pages/menuView.dart';
 
 
class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final loginBLoc = Provider.of(context);
    //final userBloc =  Provider.userBlocOf(context);
    return new Scaffold(
       body: _handleCurrentView(loginBLoc),
    );
  }

  Widget _handleCurrentView(LoginBloc loginBLoc) {
    return new StreamBuilder(
      stream: loginBLoc.isSignedIn,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return new MenuPage();
        }else{
          return new LoginPage();
        }
      }
    );
  }
}