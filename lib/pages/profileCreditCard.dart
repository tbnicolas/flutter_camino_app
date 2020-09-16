import 'package:flutter/material.dart';
import 'package:flutter_camino_app/utils/creditCardInputFormatter.dart';

class CreditCard extends StatefulWidget {
  static final String routeName = 'creditCard';

  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  String text1 = '....';
  String text2 = '....';
  String text3 = '....';
  String text4 = '....';
  String textName = '**************************************';
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        body: new SingleChildScrollView(
          child: Column(
            children: [
              new Stack(
                children: [_crearHeader(), _crearCreditCard()],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: _crearFormulario(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearFormulario() {
    return new Container(
      width: 350,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: new Column(
          children: [
            _crearNumeroTarjetaFormulario(),
            _crearFechayCvcFormulario(),
            _crearNombreFormulario(),
            _crearBoton()
          ],
        ),
      ),
    );
  }

  Widget _crearHeader() {
    return new Container(
      height: 300,
      decoration: new BoxDecoration(
        image: new DecorationImage(
            fit: BoxFit.cover,
            image: new NetworkImage(
                'https://images.vexels.com/media/users/3/131770/isolated/preview/9d615c923d10e51af4424ffdb17181dd-mapa-del-mundo-punteado-pixel-by-vexels.png')),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(38, 118, 187, 1.0),
          ],
        ),
      ),
    );
  }

  Widget _crearCreditCard() {
    return new Container(
      height: 400,
      //color: Colors.green,
      alignment: Alignment.center,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Padding(
            padding: EdgeInsets.only(top: 150.0),
            child: new ClipRRect(
              borderRadius: new BorderRadius.circular(20.0),
              child: new Container(
                height: 250,
                width: 420,
                //color: Color.fromRGBO(34, 34, 34, 1.0),
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black,
                      Color.fromRGBO(34, 34, 34, 1.0),
                    ],
                  ),
                ),
                child: new Column(
                  children: [
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: _crearTextoBanco(),
                            ),
                            new Padding(
                              padding: EdgeInsets.only(left: 30.0, top: 30),
                              child: _crearChip(),
                            ),
                          ],
                        ),
                        new Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 30.0),
                              child: _crearLogoBanco(),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: _crearDigitos(),
                    ),
                    _crearNombreyFecha()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _crearTextoBanco() {
    return new Row(
      children: [
        new Padding(
          padding: EdgeInsets.only(
            left: 30.0,
          ),
          child: new Text(
            'Black Bank',
            style: new TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget _crearLogoBanco() {
    return Padding(
      padding: EdgeInsets.only(right: 20.0, top: 25),
      child: new Container(
        height: 80,
        width: 80,
        child: new Image(
            fit: BoxFit.cover,
            image: new AssetImage('assets/images/mastercard.png')),
      ),
    );
  }

  Widget _crearChip() {
    return new Padding(
        padding: EdgeInsets.only(bottom: 30.0),
        child: new Container(
          height: 60,
          width: 60,
          child: new Image(
              fit: BoxFit.cover,
              image: new AssetImage('assets/images/chip.png')),
        ));
  }

  Widget _crearDigitos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        new Text(
          text1,
          style: new TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        new Text(
          text2,
          style: new TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        new Text(
          text3,
          style: new TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        new Text(
          text4,
          style: new TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _crearNombreyFecha() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left:30.0),
          child: new Container(
            width: 280,
          child: new Text(
            textName,
            style: new TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        )
          ),
        
        new Padding(
          padding: EdgeInsets.only(right: 35.0),
          child: new Text(
            '05/20',
            style: new TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }

  Widget _crearNumeroTarjetaFormulario() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        new Text('Numero de la Tarjeta', style: new TextStyle(fontWeight: FontWeight.w700),),
        new Container(
          width: 350,
          child: new TextField(
            onChanged: (value) {
              if (value.length == 4) {
                setState(() {
                  text1 = value.substring(0, 4);
                });
              }
              if (value.length == 9) {
                print('Entro');
                setState(() {
                  text2 = value.substring(5, 9);
                });
              }
              if (value.length == 14) {
                setState(() {
                  text3 = value.substring(10, 14);
                });
              }
              if (value.length == 19) {
                setState(() {
                  text4 = value.substring(15, 19);
                });
              }
            },
            inputFormatters: [
              MaskedTextInputFormatter(
                mask: 'xxxx xxxx xxxx xxxx',
                separator: ' ',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _crearFechayCvcFormulario() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Text('Fecha de Expiración', style: new TextStyle(fontWeight: FontWeight.w700)),
                  Padding(
                    padding: EdgeInsets.only(right: 190.0),
                    child: new Container(
                      width: 110,
                      child: new TextField(),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  new Text('CVC', style: new TextStyle(fontWeight: FontWeight.w700)),
                  new Padding(
                    padding: EdgeInsets.only(right: 0.0),
                    child: new Container(
                      width: 50,
                      child: new TextField(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _crearNombreFormulario() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Text('Nombre', style: new TextStyle(fontWeight: FontWeight.w700)),
          new Container(
              // height: 40,
              width: 350,
              //color: Colors.redAccent,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: new TextField(
                  onChanged: (value) {
                    setState(() {
                      textName = value;
                    }); 
                  }
                ),
              )),
        ],
      ),
    );
  }

  Widget _crearBoton() {
    return new Padding(
      padding: EdgeInsets.only(top:30),
      child: new GestureDetector(
        onTap: () => print('Habla'),
        child: new ClipRRect(
          borderRadius: new BorderRadius.circular(30.0),
          child: new Container(
            height: 65,
            width: 300,
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(52, 54, 101, 1.0),
                  Color.fromRGBO(38, 118, 187, 1.0),
                ],
              ),
            ),
            alignment: Alignment.center,
            child: new Text('Registrar', style: new TextStyle(
              color: Colors.white,
              fontSize: 20
            ),),
          ),
        ),
      ),
    );
  }
}
