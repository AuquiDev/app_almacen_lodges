import 'package:animate_do/animate_do.dart';
import 'package:app_almacen_lodges/models/productos_models.dart';
import 'package:app_almacen_lodges/provider/productos_provider.dart';
import 'package:app_almacen_lodges/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class MenajeriaWidget extends StatefulWidget {
  MenajeriaWidget({required this.images});
  List images = [];
  @override
  State<MenajeriaWidget> createState() => _MenajeriaWidgetState();
}

class _MenajeriaWidgetState extends State<MenajeriaWidget> {
  ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final productoProvider =
        Provider.of<ProductoProvider>(context, listen: true);
    final List<Producto> producto = productoProvider.productoList;

    return GridView.builder(
      controller: _scrollController,
      itemCount: producto.length, // <-----------
      itemBuilder: (context, index) {
        return FadeInUp(
            delay: Duration(milliseconds: index * 50),
            duration: Duration(milliseconds: (index * 50) + 800),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,5),
                    blurRadius: 10,
                    spreadRadius: 10,
                    color: kbrantTercerColor.withOpacity(.1)
                  )
                ],
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  producto[index].imagen,
                ),
              )),
            ));
      },
      gridDelegate: SliverStairedGridDelegate(
        crossAxisSpacing: 28,
        mainAxisSpacing: 14,
        startCrossAxisDirectionReversed: true,
        pattern: [
          const StairedGridTile(0.5, 0.9),
          const StairedGridTile(0.5, 0.95),
          const StairedGridTile(1.0, .96),
        ],
      ),
    );
  }
}
