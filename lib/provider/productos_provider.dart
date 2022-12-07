import 'package:app_almacen_lodges/models/productos_models.dart';
import 'package:app_almacen_lodges/utils/constanst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductoProvider extends ChangeNotifier {
  final String _baseUrl = 'api.sheety.co';
  final String _api_key = '$pathAlmacenAPi/productos';
  
  List<Producto> productoList= [];

  ProductoProvider(){
    print('Productos Provider inicializado');
    getDanzaProvider();
  }
//https://api.sheety.co/523c7b95f14e02d2a03b951150610edc/appAlmacen/productos
  getDanzaProvider() async{
    var url = Uri.https(_baseUrl,'/$pathAlmacenAPi/productos',{
      'api_key': _api_key,
    });

    final response = await http.get(url);
    final decodeData = ProductoResponsive.fromJson(response.body);
   // print(decodeData.productos);
    productoList = decodeData.productos;
    notifyListeners();
    // print(danzaList[5].producto);
 
  }
  
}