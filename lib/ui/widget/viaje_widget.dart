import 'package:app_almacen_lodges/ui/widget/modals/viaje_modals.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ViajeWidget extends StatefulWidget {
  const ViajeWidget({ Key? key }) : super(key: key);

  @override
  _ViajeWidgetState createState() => _ViajeWidgetState();
}

class _ViajeWidgetState extends State<ViajeWidget> {
  int _current = 0;
  dynamic _selectedIndex = {};

  CarouselController _carouselController = new CarouselController();

  final List<dynamic> _products = [
    {
      'title': 'Escalada \nRaquetas de nieve',
      'image': 'https://www.argentinaextrema.com/images/turismo-aventura-paquetes/g1jpg-9714.jpg',
      'description': 'Ubicacion: huito'
    },
    {
      'title': 'Camping\nCarpa Nort Face',
      'image': 'https://www.santabeatriz.com/wp-content/uploads/2020/08/carpa-mega-tech-4-personas.jpg',
      'description': 'ubicacion: Cusco'
    },
    {
      'title': 'Pesca \nSilla con Spaldar',
      'image': 'https://falabella.scene7.com/is/image/FalabellaPE/882154767_1?wid=1500&hei=1500&qlt=70',
      'description': 'Ubicacion: Oficina'
    },
     {
      'title': 'Cocina \nhorno',
      'image': 'https://mrgrill.com.pe/wp-content/uploads/2021/11/CAJA-CHINA-MEDIANA-JR-MARRON-FOTO-1.jpg',
      'description': 'Ubicacion: Oficina'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _selectedIndex.length > 0 ? FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViajeModals()));
        },
        child: const Icon(Icons.edit),
      ) : null,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Equipos de Viaje', style: TextStyle(
          color: Colors.black,
        ),)
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 450.0,
            aspectRatio: 16/9,
            viewportFraction: 0.70,
            enlargeCenterPage: true,
            pageSnapping: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }
          ),
          items: _products.map((e) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_selectedIndex == e) {
                        _selectedIndex = {};
                      } else {
                        _selectedIndex = e;
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: _selectedIndex == e ? Border.all(color: Colors.blue.shade500, width: 3) : null,
                      boxShadow: _selectedIndex == e ? [
                        BoxShadow(
                          color: Colors.blue.shade100,
                          blurRadius: 30,
                          offset: const Offset(0, 10)
                        )
                      ] : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5)
                        )
                      ]
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 320,
                            margin: const EdgeInsets.only(top: 10),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(e['image'], fit: BoxFit.cover),
                          ),
                          const SizedBox(height: 20,),
                          Text(e['title'], style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),),
                          const SizedBox(height: 20,),
                          Text(e['description'], style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600
                          ),),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList()
        ),
      ),
    );
  }
}