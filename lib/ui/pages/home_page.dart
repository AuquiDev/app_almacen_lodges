import 'package:animate_do/animate_do.dart';
import 'package:app_almacen_lodges/ui/widget/menajeria_widget.dart';
import 'package:app_almacen_lodges/ui/widget/product_widget.dart';
import 'package:app_almacen_lodges/ui/widget/seguridad_widget.dart';
import 'package:app_almacen_lodges/ui/widget/viaje_widget.dart';
import 'package:app_almacen_lodges/utils/assets_data.dart';
import 'package:app_almacen_lodges/utils/colors.dart';
import 'package:app_almacen_lodges/utils/spacing_utils.dart';
import 'package:flutter/material.dart';

class HomePageLodge extends StatefulWidget {
  const HomePageLodge({Key? key}) : super(key: key);

  @override
  _HomePageLodgeState createState() => _HomePageLodgeState();
}

class _HomePageLodgeState extends State<HomePageLodge> {
  List<String> images = [

    'https://cdn.pixabay.com/photo/2013/07/13/13/42/knife-161412_1280.png',
    'https://cdn.pixabay.com/photo/2013/07/13/13/42/knife-161412_1280.png',
    'https://cdn.pixabay.com/photo/2013/07/13/12/16/cleaver-159513_1280.png',
    'https://cdn.pixabay.com/photo/2013/07/13/13/42/knife-161412_1280.png',
    'https://cdn.pixabay.com/photo/2013/07/13/13/42/knife-161412_1280.png',
    'https://cdn.pixabay.com/photo/2013/07/13/12/16/cleaver-159513_1280.png',
  
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: NestedScrollView(
          //widget padre
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      
                      FadeInDown(
                        //este widgets permite el efecto rebote
                        child: Row(
                          children: [
                            Image.asset(
                              AssetData.logo2,
                              width: 80,
                            ),
                            wspacing20,
                            Text(
                              "Productos\nAndean Lodges",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: kbrantSecundaryColor,
                                  height: 1.3),
                            ),
                          ],
                        ),
                      ),
                      spacing20,
                      FadeInDown(
                        /** .......... */
                        delay: const Duration(milliseconds: 400),
                        duration: const Duration(milliseconds: 800),
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.3),
                              borderRadius: BorderRadius.circular(8)),
                          child: TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey.shade700,
                                ),
                                border: InputBorder.none,
                                hintText: "buscar items",
                                hintStyle: const TextStyle(color: Colors.grey)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ];
          },
          body: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                FadeInDown(
                  delay: const Duration(milliseconds: 500),
                  child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey.shade600,
                      indicatorColor: Colors.black,
                      tabs: const [
                        Tab(
                          text: 'abarrotes',//"Menajeria",
                        ),
                        Tab(
                          text: "salsas y grasas",
                        ),
                        Tab(
                          text: "Snack",
                        ),
                        Tab(
                          text: "Postres",
                        )
                      ]),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      MenajeriaWidget(images: images,),
                      ProductosWidget(),
                       ViajeWidget(),
                       SeguridadWidget()
                    ],
                  ),
                )
              ],
            ),
          )),
    ));
  }
}
