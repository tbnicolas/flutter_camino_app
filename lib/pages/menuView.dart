import 'package:flutter/material.dart';
import 'package:flutter_camino_app/pages/comercio_page.dart';
import 'package:flutter_camino_app/pages/crearMetodosDePago_page.dart';
import 'package:flutter_camino_app/pages/toDoList_page.dart';
import 'package:flutter_camino_app/pages/youtubeChannel.dart';
import 'package:flutter_camino_app/utils/footer_utils.dart';
import 'package:flutter_camino_app/utils/sizeConfig_utils.dart';

class MenuPage extends StatefulWidget {
  static final String routeName = 'menu';
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    print('Size 0.45: ${size.height * 0.45}');
    print('Size 0.30: ${size.height * 0.30}');
    print('Size 0.65: ${size.height * 0.65}');
    print('Button Size: ${4.79403409091 * SizeConfig.heightMultiplier}');

    return Scaffold(
      body: new SafeArea(child: menu()),
      bottomNavigationBar:new FooterUtils(),
    );
  }

  Widget menu() {

    return new SingleChildScrollView(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _headerStack(),
          /* Row(
            children: [
              bienvenidaTexto,
            ],
          ), */
          new Container(
            //color: Colors.amberAccent,
            constraints: 
                new BoxConstraints(maxHeight: 50 * SizeConfig.heightMultiplier),
            width: double.infinity,
            child: new PageView(
              //physics: BouncingScrollPhysics(),
              children: <Widget>[
                 _botonesRedondeados(context),
                
              ],
            ),
          ),
          //new Container(height: 300, color: Colors.amber,)
        ],
      ),
    );
  }

  Widget _headerStack() {
    return new Stack(
      children: <Widget>[_header(), _getImage()],
    );
  }

  Widget _getImage() {
    print('image Top Paddign: ${10.433604336 * SizeConfig.heightMultiplier }');
    print('header height: ${ 40 * SizeConfig.heightMultiplier}');
    print('${ 40 * SizeConfig.heightMultiplier -(25 * SizeConfig.heightMultiplier)-80}');
    double df = 8.52272727273 * SizeConfig.heightMultiplier-10.433604336 * SizeConfig.heightMultiplier;
    print('df: $df');
    return Padding(
      padding: EdgeInsets.only(
          top: (df<0)?10.433604336 * SizeConfig.heightMultiplier+4 :10.433604336 * SizeConfig.heightMultiplier - 4,
          left: 10.4166666667 * SizeConfig.widthMultiplier),
      child: new Center(
        child: new SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
           mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new SizedBox(
                width: double.infinity,
              ),
              new Container(
                //color: Colors.red,
                // padding: EdgeInsets.only(top:50),
                constraints: new BoxConstraints(
                  maxHeight: 25 * SizeConfig.heightMultiplier,
                  maxWidth: 35 * SizeConfig.heightMultiplier,
                ),

                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage('assets/images/header.png'),
                        fit: BoxFit.fill)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return new ClipPath(
        clipper: new MyClipper(),
        child: Container(
          constraints:
              new BoxConstraints(maxHeight: 40 * SizeConfig.heightMultiplier),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(52, 54, 101, 1.0),
                Color.fromRGBO(38, 118, 187, 1.0),
              ],
            ),
          ),
        )
    );
  }

  

  Widget botones(BuildContext context, String ruta) {
    return new Padding(
      padding: EdgeInsets.only(
        top: 1.59801136364 * SizeConfig.heightMultiplier,
        bottom: 1.59801136364 * SizeConfig.heightMultiplier,
        left: 3.125 *SizeConfig.widthMultiplier,
        right:  3.125 *SizeConfig.widthMultiplier,
      ),
      child: new Column(
        children: [
          new ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(2.66335227273 * SizeConfig.heightMultiplier),
              topLeft: Radius.circular(2.66335227273 * SizeConfig.heightMultiplier),
              bottomLeft: Radius.circular(2.66335227273 * SizeConfig.heightMultiplier),
              bottomRight: Radius.circular(2.66335227273 * SizeConfig.heightMultiplier),
            ),
            child: new GestureDetector(
              onTap: () => Navigator.pushNamed(context, ruta), 
              child: new Container(
                width: 10.6534090909 * SizeConfig.heightMultiplier,
                height: 10.6534090909 * SizeConfig.heightMultiplier,
                color: Color.fromRGBO(154, 206, 223, 1),
                child: new Center(
                  child: new Icon(
                    Icons.person,
                    size: 4.79403409091 * SizeConfig.heightMultiplier, 
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.63920454545 * SizeConfig.heightMultiplier),
            child: new Text('Hola Mundo'),
          )
        ],
      ),
    );
  }

  Widget _botonesRedondeados(BuildContext context) {
    return new Table(
      children: <TableRow>[
        new TableRow(children: <Widget>[
          botones(context,''),
          botones(context,''),
          botones(context,YoutubeChannelPage.routeName),
        ]),
        new TableRow(children: <Widget>[
          botones(context, ToDOListPage.routeName),
          botones(context, ComercioPage.routeName),
          botones(context,''),
        ]),
        new TableRow(children: <Widget>[
          botones(context,''),
          botones(context,SeleccionarPagoPage.routeName),
          botones(context,''),
        ]),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0, size.height - 8.52272727273 * SizeConfig.heightMultiplier);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 8.52272727273 * SizeConfig.heightMultiplier);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
