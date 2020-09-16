import 'package:flutter/material.dart';
import 'package:flutter_camino_app/blocs/providers.dart';
import 'package:flutter_camino_app/pages/login_page.dart';
import 'package:flutter_camino_app/routes/routes.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'utils/sizeConfig_utils.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Provider(
      child: LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return new MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'El camino',
                routes: getRoutes(),
            );
          },
        );
      },
    )
    );
  }
}