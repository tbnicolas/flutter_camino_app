import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_camino_app/pages/profileCreditCard.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Modal{
  mainBottomSheet(BuildContext context){
    showBarModalBottomSheet(
      context: context,
      builder: (context, scrollController) => Container(
        height: 400,
        child: Scaffold(
          
          appBar: new AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: new Text('¿Que forma de pago deseas añadir?'),
          ),
          body: new SingleChildScrollView(
            controller: scrollController,
            child: new Column(
              children: [
                _createTile(context, 'MasterCard',_action1)
            ],),
          ),
        ),
      ),
    );
  }

  ListTile _createTile(BuildContext context, String name, Function action){
    return ListTile(
      leading: new Image(image: new AssetImage('assets/images/mastercard.png')),
      trailing: new Icon(Icons.arrow_forward_ios),
      title: Text(name),
      onTap: (){
        Navigator.pop(context);
        action(context);
      },
    );
  }

  _action1(BuildContext context){
     Navigator.pushNamed(context, CreditCard.routeName); 
  }

  /* _action2(){
    print('action 2');
  }

  _action3(){
    print('action 3');
  } */
}