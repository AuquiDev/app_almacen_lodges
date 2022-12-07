
import 'package:app_almacen_lodges/utils/colors.dart';
import 'package:app_almacen_lodges/utils/spacing_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductosWidget extends StatefulWidget {
  const ProductosWidget({Key? key}) : super(key: key);

  @override
  _ProductosWidgetState createState() => _ProductosWidgetState();
}

class _ProductosWidgetState extends State<ProductosWidget> {
  final List<dynamic> _productos = [
    {
      'color': kbrantPrimaryColor,
      'name': 'Fideo',
      'image':
          'https://corporacionliderperu.com/41939-large_default/molitalia-fideo-sopa-x-250-gr-tornillo.jpg',
    },
    {
      'color': kbrantSecundaryColor,
      'name': 'Tallarin',
      'image':
          'https://corporacionliderperu.com/41939-large_default/molitalia-fideo-sopa-x-250-gr-tornillo.jpg',
    },
    {
      'color': kbrantTercerColor,
      'name': 'Arroz',
      'image':
          'https://corporacionliderperu.com/41939-large_default/molitalia-fideo-sopa-x-250-gr-tornillo.jpg',
    },
    {
      'color': Colors.black,
      'name': 'Avena',
      'image':
          'https://plazavea.vteximg.com.br/arquivos/ids/978209-1000-1000/20146356.jpg',
    }
  ];

  int _current = 0;
  dynamic _selectedIndex = {};

  CarouselController _carouselController = new CarouselController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CarouselSlider(
          //widget package
          carouselController: _carouselController,
          options: CarouselOptions(
              height: 350.0,
              aspectRatio: 4 / 3,
              pageSnapping: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: _productos.map((e) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductView(
                          product: e,
                        ),
                      ),
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: width,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.4),
                              blurRadius: 10,
                              offset: const Offset(0, 5))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Producto: ${e['name']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const Text('Stok: 20',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15)),
                        Divider(
                          color: kbrantTercerColor,
                        ),
                        spacing6,
                        Hero(
                          transitionOnUserGestures: true,
                          tag: e['color'],
                          child: Container(
                            height: 200,
                            width: 200,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(e['image'], fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList()),
    );
  }
}

class ProductView extends StatefulWidget {
  final dynamic product;
  const ProductView({Key? key, required this.product}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Hero(
                    
                      tag: widget.product['color'],
                      transitionOnUserGestures: true,
                      child: Center(
                        child: Image.network(
                          widget.product['image'],
                          width: 200,
                          height: 200,
                        ),
                      )),
                ),
                wspacing14,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre: ${widget.product['name']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    const Text('Categoria: Productos',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15)),
                            spacing20,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(10),
                       decoration: BoxDecoration(
                         color: Colors.amber,
                         borderRadius: BorderRadius.circular(10)
                       ),
                        child: const Text('Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, 
                                color: Colors.blueAccent,
                                fontSize: 15)),
                      ),
                    ),   
                  ],
                ),
              ],
            ),
            ListTile(
              title: const Text('Marca: Molitalia'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'fecha Compra: ${DateTime.now().day} de  ${DateTime.now().month} del  ${DateTime.now().year}',
                      style:
                          const TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                  Text(
                      'fecha vencimiento: ${DateTime.now().day} de  ${DateTime.now().month} del  ${DateTime.now().year}',
                      style:
                          const TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                  const Text('Proveedor 1: La Canasta',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                            const Text('contacto 1: 976 257051',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),

                              const Text('Proveedor 2: La Canasta',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                          
                               const Text('contacto 1: 976 257051',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                  const Text('Precio Unid: s/.20.00',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                  const Text('Precio Paquete: s/.102.00',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                  const Text('Direccion : Button google maps',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                  const Text('Stock: 32',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                  const Text('Descripcion: Ex non dolor pariatur sit non commodo officia. In nisi Lorem sunt magna esse dolore minim aute duis ex reprehenderit pariatur ex. Magna nisi officia labore ipsum incididunt nostrud eu ut consectetur velit ut.',
                     textAlign: TextAlign.justify,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
