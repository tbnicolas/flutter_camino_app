import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_camino_app/pages/categoria_page.dart';
import 'package:flutter_camino_app/providers/firebaseUser_providers.dart';
import 'package:flutter_camino_app/utils/footer_utils.dart';
import 'package:flutter_camino_app/utils/sizeConfig_utils.dart';

class ComercioPage extends StatefulWidget {
  static final String routeName = 'comercio';

  @override
  _ComercioPageState createState() => _ComercioPageState();
}

class _ComercioPageState extends State<ComercioPage> {
  final firebaseUserProvider = new FirebaseUserProvider();
  bool impar = false;
  int colorIndex = 0;
  Future<List> _agruparCategorias() async {
    print('ENTRO!W');
    int index = 0;
    Map<int, dynamic> json;
    List list = new List();
    List jsonList = new List();
    String auxImpar;
    final listProduct = await firebaseUserProvider.getCategoria();
    print('ListP: $listProduct');
    if (listProduct.length % 2 != 0) {
      auxImpar = listProduct.elementAt(listProduct.length - 1);
      listProduct.removeAt(listProduct.length - 1);
      impar = true;
    }
    listProduct.forEach((producto) {
      print(producto);
      if (list.length == 1) {
        index++;
        list.add(producto);
        json = new Map();
        json[index] = list;
        jsonList.add(json);
        list = new List();
      } else {
        list.add(producto);
      }
    });
    if (impar) {
      // print('IMPAR:${auxImpar.name}');
      index++;
      json = new Map();
      list = new List();
      list.add(auxImpar);
      json[index] = list;
      jsonList.add(json);
    }
    //jsonList.forEach((element) {print(element[3]);});
    return jsonList;
  }

  @override
  Widget build(BuildContext context) {
    print('Entro232');
    Size size = MediaQuery.of(context).size;
    print('sizeH.30:${size.height - 30.0}');
    print('sizeH.50:${size.height - 50.0}');
    print('sizeH.80:${size.height - 80.0}');
    print('sizeH.10:${size.height - 10.0}');

    return new FutureBuilder(
      future: _agruparCategorias(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          List jsonListResult = snapshot.data;
          print('Entrpo ${jsonListResult.length}');
          return new SafeArea(
            child: new Scaffold(
              body: _crearPagina(jsonListResult),
              bottomNavigationBar: new FooterUtils(),
            ),
          );
        } else {
          return new Scaffold(
            body: new Center(
              child: new CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  final pList = List.generate(
      100,
      (index) => new Container(
            height: 200,
            width: 250,
           color: Colors.red,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              new Container(
                height: 220,
                color: Colors.blue,
                child: new Image(
                  fit: BoxFit.cover,
                  image: new NetworkImage(
                      'https://www.blogdefotografia.tucamara.cl/wp-content/uploads/2017/12/fotografia-de-paisaje-1-900x450.jpg'),
                  
                ),
              ),
                  new ListTile(
                    title: new Text('Heading 1'),
                    subtitle: new Text('SubHeading 1'),
                  )
            ],)
          ));


  Widget _crearBottom(List jsonListResult){
    return  new Container(
       height: 300,
      child: new ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: jsonListResult.length,
        itemBuilder: (context, index) {
          print('Tamaño: ${jsonListResult.length}');
         // final jsonMap = jsonListResult[index-1];
          return botones(context,Colors.redAccent,'Hola');
            /* if (impar) {
              final jsonMap = jsonListResult[index-1]; 
              print('jsonMAp: $jsonMap');
              return _impar(index, jsonMap, false) ;
                  //? _impar(index, jsonMap, true)
                  //: _impar(index, jsonMap, false); 
            } else {
              final jsonMap = jsonListResult[index-1];
              print('jsonMAp: $jsonMap');
              return _par(index, jsonMap);
            } */
          }
      ),
    );
  }          

  Widget _crearPagina(List jsonListResult) {
    print('M]UNDP: ${jsonListResult.length}');
    final bottom = new Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 300,
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.0, left: 10),
            child: pList[index],
          );
        },
      ),
    );


    return new SingleChildScrollView(
      child: new Column(children: [
        _crearTop(),
        _crearBottom(jsonListResult) 
      ],),
    );

    
  }

  Widget _impar(int index, jsonMap, bool opt) {
    return new Table(
      children: opt
          ? <TableRow>[
              new TableRow(children: <Widget>[
                botones(context, colorRandom(), jsonMap[index][0]),
                new Container()
              ]),
            ]
          : <TableRow>[
              new TableRow(children: <Widget>[
                botones(context, colorRandom(), jsonMap[index][0]),
                botones(context, colorRandom(), jsonMap[index][1]),
              ]),
            ],
    );
  }

  Widget _par(int index, jsonMap) {
    return new Table(
      children: [
        new TableRow(children: <Widget>[
          botones(context, colorRandom(), jsonMap[index][0]),
          botones(context, colorRandom(), jsonMap[index][1]),
        ]),
      ],
    );
  }

  Widget botones(BuildContext context, Color color, String categoria) {
    return new Padding(
      padding: EdgeInsets.only(
        top: 1.59801136364 * SizeConfig.heightMultiplier,
        bottom: 1.59801136364 * SizeConfig.heightMultiplier,
        left: 3.125 * SizeConfig.widthMultiplier,
        right: 3.125 * SizeConfig.widthMultiplier,
      ),
      child: new Column(
        children: [
          new ClipRRect(
            borderRadius: BorderRadius.only(
              topRight:
                  Radius.circular(0.85227272727 * SizeConfig.heightMultiplier),
              topLeft:
                  Radius.circular(0.85227272727 * SizeConfig.heightMultiplier),
              bottomLeft:
                  Radius.circular(0.85227272727 * SizeConfig.heightMultiplier),
              bottomRight:
                  Radius.circular(0.85227272727 * SizeConfig.heightMultiplier),
            ),
            child: new GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new CategoriaPage(
                            idCategorias: categoria,
                          ))),
              child: new Container(
                width: 41.6666666667 * SizeConfig.widthMultiplier,
                height: 10.6534090909 * SizeConfig.heightMultiplier,
                color: color,
                alignment: Alignment.topLeft,
                child: new Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8.0),
                  child: new Text(
                    categoria,
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 2.13068181818 * SizeConfig.heightMultiplier,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color colorRandom() {
    Color colorSeleccionado;

    print('PRIMER CI: $colorIndex');
    List<Color> colores = [
      Colors.orange,
      Colors.red,
      Colors.amberAccent,
      Colors.indigo,
      Colors.green,
      Colors.pinkAccent,
      Colors.teal
    ];

    if (colorIndex == colores.length - 1) {
      print('Entro');
      colorSeleccionado = colores[colorIndex];
      colorIndex = 0;
    } else {
      colorSeleccionado = colores[colorIndex];
      colorIndex++;
    }
    print('Color Index: $colorIndex || ColoresLength= ${colores.length}');

    return colorSeleccionado;
  }

  Widget _crearTop() {
    return new Stack(
      children: <Widget>[
        new ClipPath(
          clipper: new CustomShapeClipper(),
          child: new Container(
            height: 42.6136363636 * SizeConfig.heightMultiplier,
            decoration: new BoxDecoration(
                gradient: new LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(52, 54, 101, 1.0),
                Color.fromRGBO(38, 118, 187, 1.0),
              ],
            )),
          ),
        ),
        new Container(
          height: 42.6136363636 * SizeConfig.heightMultiplier,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new SizedBox(
                width: double.infinity,
              ),
              new Text(
                'Encuantra aquí\ntodo lo que necesitas',
                style: TextStyle(
                  fontSize: 2.55681818182 * SizeConfig.heightMultiplier,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              new Padding(
                padding: EdgeInsets.only(
                    top: 0.53267045454 * SizeConfig.heightMultiplier),
                child: new ClipRRect(
                  borderRadius: BorderRadius.circular(
                      4.26136363636 * SizeConfig.heightMultiplier),
                  child: new Container(
                      height: 6.39204545455 * SizeConfig.heightMultiplier,
                      width: 12.5 * SizeConfig.widthMultiplier,
                      color: Colors.white,
                      child: new IconButton(
                          alignment: Alignment.center,
                          icon: new Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 8.33333333333 * SizeConfig.widthMultiplier,
                          ),
                          onPressed: () => print('Hola'))),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width * .5, size.height - 30.0);
    var firstControlpoint = Offset(size.width * 0.25, size.height - 50.0);
    path.quadraticBezierTo(firstControlpoint.dx, firstControlpoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 80.0);
    var secondControlPoint = Offset(size.width * .75, size.height - 10);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
