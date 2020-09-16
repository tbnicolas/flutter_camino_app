import 'package:flutter/material.dart';
import 'package:flutter_camino_app/utils/Modal.dart';

class SeleccionarPagoPage extends StatefulWidget {
  static final String routeName = 'select';

  @override
  _SeleccionarPagoPageState createState() => _SeleccionarPagoPageState();
}

class _SeleccionarPagoPageState extends State<SeleccionarPagoPage> {
  Modal modal = new Modal();
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: [
          _crearSliverAppBar(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => modal.mainBottomSheet(context),
        backgroundColor: Colors.blue,
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget _crearSliverAppBar() {
    return new SliverAppBar(
      expandedHeight: 60,
      flexibleSpace: new FlexibleSpaceBar(
        centerTitle: true,
        title: new Text('Tus Metodos de pago'),
        background: new Container(
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
        ),
      ),
    );
  }
}
