// To parse this JSON data, do
//
//     final productoResponsive = productoResponsiveFromMap(jsonString);

import 'dart:convert';

class ProductoResponsive {
    ProductoResponsive({
      required  this.productos,
    });

    List<Producto> productos;

    factory ProductoResponsive.fromJson(String str) => ProductoResponsive.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductoResponsive.fromMap(Map<String, dynamic> json) => ProductoResponsive(
        productos: List<Producto>.from(json["productos"].map((x) => Producto.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "productos": List<dynamic>.from(productos.map((x) => x.toMap())),
    };
}

class Producto {
    Producto({
      required  this.producto,
      required  this.marca,
     required   this.precioUnid,
     required   this.precio,
     required   this.contenido,
     required   this.fechaVencimiento,
    required    this.descripcion,
     required   this.stock,
    required    this.categoria,
     required   this.requerimiento,
    required    this.importe,
     required   this.proveedorId,
    required    this.status,
    required    this.imagen,
    required    this.id,
    });

    String producto;
    String marca;
    int precioUnid;
    dynamic precio;
    String contenido;
    String fechaVencimiento;
    String descripcion;
    int stock;
    String categoria;
    dynamic requerimiento;
    double importe;
    String proveedorId;
    bool status;
    String imagen;
    int id;

    factory Producto.fromJson(String str) => Producto.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Producto.fromMap(Map<String, dynamic> json) => Producto(
        producto: json["producto"],
        marca: json["marca"],
        precioUnid: json["precioUnid"],
        precio: json["precio"],
        contenido: json["contenido"],
        fechaVencimiento: json["fechaVencimiento"],
        descripcion: json["descripcion"],
        stock: json["stock"],
        categoria: json["categoria"],
        requerimiento: json["requerimiento"],
        importe: json["importe"].toDouble(),
        proveedorId: json["proveedorId"],
        status: json["status"],
        imagen: json["imagen"],
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "producto": producto,
        "marca": marca,
        "precioUnid": precioUnid,
        "precio": precio,
        "contenido": contenido,
        "fechaVencimiento": fechaVencimiento,
        "descripcion": descripcion,
        "stock": stock,
        "categoria": categoria,
        "requerimiento": requerimiento,
        "importe": importe,
        "proveedorId": proveedorId,
        "status": status,
        "imagen": imagen,
        "id": id,
    };
}
