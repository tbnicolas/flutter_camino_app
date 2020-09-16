import 'package:flutter/material.dart';
import 'package:flutter_camino_app/pages/categoria_page.dart';
import 'package:flutter_camino_app/pages/comercio_page.dart';
import 'package:flutter_camino_app/pages/crearMetodosDePago_page.dart';
import 'package:flutter_camino_app/pages/home_page.dart';
import 'package:flutter_camino_app/pages/login_page.dart';
import 'package:flutter_camino_app/pages/menuView.dart';
import 'package:flutter_camino_app/pages/negocio_page.dart';
import 'package:flutter_camino_app/pages/openImage_page.dart';
import 'package:flutter_camino_app/pages/profileCreditCard.dart';
import 'package:flutter_camino_app/pages/signUp_page.dart';
import 'package:flutter_camino_app/pages/toDoList_page.dart';
import 'package:flutter_camino_app/pages/youtubeChannel.dart';

Map<String,WidgetBuilder> getRoutes(){
 return<String, WidgetBuilder>{
  '/':(BuildContext context)=>new LoginPage(),
  HomePage.routeName:(BuildContext context)=>new HomePage(),
  SignUp.routeName:(BuildContext context)=>new SignUp(),
  MenuPage.routeName:(BuildContext context)=>new MenuPage(),
  Negocio.routeName:(BuildContext context)=>new Negocio(),
  OpenImagePage.routeName:(BuildContext context)=>new OpenImagePage(),
  ComercioPage.routeName:(BuildContext context)=>new ComercioPage(),
  YoutubeChannelPage.routeName:(BuildContext context)=>new YoutubeChannelPage(),
  CreditCard.routeName:(BuildContext context)=>new CreditCard(),
  SeleccionarPagoPage.routeName:(BuildContext context)=>new SeleccionarPagoPage(),
  ToDOListPage.routeName:(BuildContext context)=>new ToDOListPage(),

 };
}