import 'package:flutter/material.dart';
import 'package:flutter_camino_app/pages/openImage_page.dart';
import 'package:flutter_camino_app/utils/sizeConfig_utils.dart';
import 'package:link/link.dart';

class Negocio extends StatelessWidget {
  static final String routeName = 'negocio';

  Future<List<String>> urlImages() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      'https://cdn.shopify.com/s/files/1/0406/0915/3174/products/BBF2991_grande.png?v=1594743908',
      'https://cdn.shopify.com/s/files/1/0406/0915/3174/products/BBF3476_grande.jpg?v=1592002735',
      'https://cdn.shopify.com/s/files/1/0406/0915/3174/products/BBF0938_d4c07424-926a-4963-9cea-9cd1483c7678_grande.jpg?v=1592535335',
      'https://cdn.shopify.com/s/files/1/0406/0915/3174/products/BBF3484_grande.jpg?v=1592002678',
      'https://cdn.shopify.com/s/files/1/0406/0915/3174/products/WhatsAppImage2020-07-13at3.20.56PM_grande.jpg?v=1594767585'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          _crearAppbar(),
          new SliverList(
              delegate: new SliverChildListDelegate([
            //new Text(''),
            new Padding(
              padding: EdgeInsets.only(top: 2.66335227273 * SizeConfig.heightMultiplier),
              child: _crearTitulo('Descripción'),
            ),
            new Padding(
              padding: EdgeInsets.only(bottom: 2.66335227273 * SizeConfig.heightMultiplier),
              child: _crearDescripcion(),
            ), 

            new Padding(
              padding: EdgeInsets.only(bottom: 3.72869318182 * SizeConfig.heightMultiplier),
              child: _crearTitulo('Imagenes relacionadas'),
            ),
            _crearProductos(),
            new Padding(
              padding: EdgeInsets.only(top: 2.66335227273 * SizeConfig.heightMultiplier, bottom: 3.72869318182 * SizeConfig.heightMultiplier),
              child: _crearTitulo('Contacto'),
            ),
            _crearContacto(),
            new SizedBox(
              height: 3.19602272727 * SizeConfig.heightMultiplier,
            )
          ]))
        ],
      ),
    );
  }

  Widget _crearContacto() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Container(
            height: 4.26136363636 * SizeConfig.heightMultiplier,
            width: 4.26136363636 * SizeConfig.heightMultiplier,
            child: new FadeInImage(
              fit: BoxFit.cover,
              placeholder: new AssetImage('assets/images/no-image.jpg'),
              image: new AssetImage('assets/images/facebook.png'),
            )),
        new Container(
            height: 4.79403409091 * SizeConfig.heightMultiplier,
            width: 4.79403409091 * SizeConfig.heightMultiplier,
            child: new FadeInImage(
              fit: BoxFit.cover,
              placeholder: new AssetImage('assets/images/no-image.jpg'),
              image: new AssetImage('assets/images/whatsapp.png'),
            )),

        new Link(
         url: 'https://www.google.com.co/',
         child: new Container(
              height: 4.79403409091 * SizeConfig.heightMultiplier,
              width: 4.79403409091 * SizeConfig.heightMultiplier,
              child: new FadeInImage(
                fit: BoxFit.cover, 
                placeholder: new AssetImage('assets/images/no-image.jpg'),
                image: new AssetImage('assets/images/instagram.png'),
              )),
       ),
      ],
    );
  }

  Widget _crearTitulo(String texto) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.66666666667 * SizeConfig.widthMultiplier),
      child: new Text(
        texto,
        style: new TextStyle(
            color: Colors.black, fontSize: 5.20833333333 * SizeConfig.widthMultiplier, fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _crearAppbar() {
    final textoAppbar = new Text(
      'Brownies LaMars',
      style: new TextStyle(
        color: Colors.black,
        fontSize: 16.0,
      ),
      overflow: TextOverflow.ellipsis,
      //overflow: TextOverflow.ellipsis
    );
    return new SliverAppBar(
        elevation: 2.0,
        backgroundColor: Colors.blue,
        expandedHeight: 26.6335227273 * SizeConfig.heightMultiplier,
        floating: false,
        pinned: true,
        flexibleSpace: new FlexibleSpaceBar(
          centerTitle: true,
          //title: textoAppbar,
          background: new FadeInImage(
              fit: BoxFit.cover,
              placeholder: new NetworkImage(
                  'https://flevix.com/wp-content/uploads/2020/01/Bounce-Bar-Preloader-1.gif'),
              image: new NetworkImage(
                  'https://ii.ct-stc.com/1/logos/empresas/2016/10/31/fabrizio-emiliani-jimeno-B78210B92B7108CFthumbnail.jpeg')),
        ));
  }

  Widget _crearDescripcion() {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 1.66666666667 * SizeConfig.widthMultiplier, vertical: 2.13068181818 * SizeConfig.heightMultiplier),
      child: new Text(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
        textAlign: TextAlign.justify,
        style: new TextStyle(fontSize: 3.33333333333 * SizeConfig.widthMultiplier),
      ),
    );
  }

  Widget _crearProductos() {
    return new FutureBuilder(
      future: urlImages(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.hasData) {
          return _crearProductosPageView(snapshot.data);
        } else {
          return new Center(child: new CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearProductosPageView(List<String> productsImages) {
    return new SizedBox(
      height: 21.3068181818 * SizeConfig.heightMultiplier,
      child: new PageView.builder(
        pageSnapping: false,
        physics: BouncingScrollPhysics(),
        controller: new PageController(viewportFraction: 0.3, initialPage: 1),
        itemCount: productsImages.length,
        itemBuilder: (context, i) =>
            _productoTarjeta(context, productsImages[i]),
      ),
    );
  }

  Widget _productoTarjeta(BuildContext context, String url) {
    return new Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.66666666667 * SizeConfig.widthMultiplier),
      child: new GestureDetector(
        onTap: () => Navigator.pushNamed(context, OpenImagePage.routeName,
            arguments: url),
        child: new Container(
          child: new Column(
            children: <Widget>[
              new ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: new FadeInImage(
                  placeholder: new AssetImage('assets/images/no-image.jpg'),
                  image: new NetworkImage(url),
                  height: 15.9801136364 * SizeConfig.heightMultiplier,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
