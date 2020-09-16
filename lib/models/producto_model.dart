// To parse this JSON data, do
//
//     final producto = productoFromJson(jsonString);

import 'dart:convert';

Producto productoFromJson(String str) => Producto.fromJson(json.decode(str));

String productoToJson(Producto data) => json.encode(data.toJson());

class Producto {
    String name;
    String schedule;
    String info;
    String id;
    String urlImage;
    SocialNetworks socialNetworks;
    

    Producto({
        this.name,
        this.schedule,
        this.info,
        this.id,
        this.urlImage,
        this.socialNetworks,
    });

    factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        name: json["name"],
        schedule: json["schedule"],
        info: json["info"],
        urlImage: json["urlImage"],
        id: json["id"],
        socialNetworks: SocialNetworks.fromJson(json["socialNetworks"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "schedule": schedule,
        "info": info,
        "id": id,
        "urlImage": urlImage,
        "socialNetworks": socialNetworks.toJson(),
    };

    
}

class SocialNetworks {
    SocialNetworks({
        this.whatsapp,
        this.instagram,
        this.facebook,
    });

    int whatsapp;
    String instagram;
    String facebook;

    factory SocialNetworks.fromJson(Map<String, dynamic> json) => SocialNetworks(
        whatsapp: json["whatsapp"],
        instagram: json["instagram"],
        facebook: json["facebook"],
    );

    Map<String, dynamic> toJson() => {
        "whatsapp": whatsapp,
        "instagram": instagram,
        "facebook": facebook,
    };
}
