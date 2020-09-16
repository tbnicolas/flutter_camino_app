import 'package:flutter/material.dart';
import 'package:flutter_camino_app/models/producto_model.dart';
import 'package:flutter_camino_app/pages/negocio_page.dart';
import 'package:flutter_camino_app/providers/firebaseUser_providers.dart';
import 'package:flutter_camino_app/utils/footer_utils.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class CategoriaPage extends StatefulWidget {
  static final String routeName = 'categoria';
  final idCategorias;
  CategoriaPage({@required this.idCategorias});
  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  final firebaseUserProvider = new FirebaseUserProvider();
  bool impar = false;
  int index = 0;
  Text textoAppbar = new Text(
    'Buscar',
    style: new TextStyle(
        color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.w800),
    overflow: TextOverflow.ellipsis,
    //overflow: TextOverflow.ellipsis
  );
  Text textoSearch = new Text(
    'Que Negocio buscas?',
    style: new TextStyle(
      color: Colors.black26,
      fontSize: 20.0,
    ),
    overflow: TextOverflow.ellipsis,
    //overflow: TextOverflow.ellipsis
  );

  Future<List> _agruparProductor() async {
    int index = 0;
    Map<int, dynamic> json;
    List<Producto> list = new List();
    List jsonList = new List();
    Producto auxImpar;
    final listProduct = await firebaseUserProvider.getProducto(widget.idCategorias);
    if (listProduct.length % 2 != 0) {
      auxImpar = listProduct.elementAt(listProduct.length - 1);
      listProduct.removeAt(listProduct.length - 1);
      impar = true;
    }
    listProduct.forEach((producto) {
      //print(producto.name);
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
      json[index] =  list;
      jsonList.add(json);
    }
    //jsonList.forEach((element) {print(element[3]);});
    return jsonList;
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: _agruparProductor(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          List jsonListResult = snapshot.data;
          return new SafeArea(
            child: new Scaffold(
              body: new CustomScrollView(
                slivers: <Widget>[
                  _createAnimatedAppBar(context),
                  _createSliverBody(context, jsonListResult),
                ],
              ),
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

  Widget _createSliverBody(BuildContext context, List jsonListResult) {
    print('Tamaño: ${jsonListResult.length}');

    jsonListResult.forEach((element) {
      print('sliver: $element');
    });
    return new SliverStickyHeader(
      //overlapsContent: false,
      header: new Container(
        height: 80.0,
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
        alignment: Alignment.centerLeft,
        child: new GestureDetector(
          onTap: () {
            print('Buscando...');
          },
          child: new Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: new Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: new ListTile(
                leading: new Icon(
                  Icons.search,
                  size: 40,
                ),
                title: textoSearch,
              ),
            ),
          ),
        ),
      ),
      sliver: SliverList(
          delegate:
              new SliverChildBuilderDelegate((BuildContext context, int index) {
        var jsonMap = jsonListResult[index];
        print('jsonMAp: $jsonMap');
        if (impar) {
          return index+1 == jsonListResult.length
              ? _impar(index, jsonMap, true)
              : _impar(index, jsonMap, false);
        } else {
          return _par(index,jsonMap);
        }
      }, childCount: jsonListResult.length)),
    );
  }

  Widget _impar(int index, jsonMap, bool opt) {
    return new Table( 
      children: opt
          ? <TableRow>[
              new TableRow(children: <Widget>[
                botones(context,jsonMap[index+1][0]),
                new Container()
              ]),
            ]
          : <TableRow>[
              new TableRow(children: <Widget>[
                botones(context, jsonMap[index + 1][0]),
                botones(context, jsonMap[index + 1][1]),
              ]),
            ],
    );
  }

  Widget _par(int index,jsonMap) {
    return new Table(
      children: [
        new TableRow(children: <Widget>[
          botones(context, jsonMap[index + 1][0]),
          botones(context, jsonMap[index + 1][1]),
        ]),
      ],
    );
  }

  Widget _createAnimatedAppBar(BuildContext context) {
    return SliverList(
        delegate: new SliverChildListDelegate([
      new Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          //color: Colors.lightBlue,
          alignment: Alignment.centerLeft,
          child: new Padding(
              padding: EdgeInsets.only(left: 15.0, top: 20),
              child: textoAppbar),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(52, 54, 101, 1.0),
                Color.fromRGBO(38, 118, 187, 1.0),
              ],
            ),
          ))
    ]));
  }

  Widget botones(BuildContext context, Producto productoResult) {
    return new Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: new Column(
        children: [
          new ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
            ),
            child: new GestureDetector(
              onTap: () => Navigator.pushNamed(context, Negocio.routeName),
              child: new Container(
                height: 200,
                width: 200,
                child: new FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: new AssetImage('assets/images/no-image.jpg'),
                    image: new NetworkImage(productoResult.urlImage)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: new Text(
              productoResult.name ?? '',
              style: new TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.0),
            child: new Text(
              productoResult.schedule ?? '',
              style: new TextStyle(
                  color: Colors.black38, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
