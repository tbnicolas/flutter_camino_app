// To parse this JSON data, do
//
//     final categorias = categoriasFromJson(jsonString);

import 'dart:convert';

Categorias categoriasFromJson(String str) => Categorias.fromJson(json.decode(str));

String categoriasToJson(Categorias data) => json.encode(data.toJson());

class Categorias {
    String id;
    List<dynamic> productos;
    
    Categorias({
        this.id,
        this.productos,
    });


    factory Categorias.fromJson(Map<String, dynamic> json) => Categorias(
        id: json["id"],
        productos: List<dynamic>.from(json["Productos"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Productos": List<dynamic>.from(productos.map((x) => x)),
    };
}
