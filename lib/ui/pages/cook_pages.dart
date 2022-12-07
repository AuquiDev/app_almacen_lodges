import 'package:app_almacen_lodges/utils/assets_data.dart';
import 'package:app_almacen_lodges/utils/spacing_utils.dart';
import 'package:flutter/material.dart';

class CookPages extends StatefulWidget {
  const CookPages({ Key? key }) : super(key: key);

  @override
  _CookPagesState createState() => _CookPagesState();
}

class _CookPagesState extends State<CookPages> {
  PageController? _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacing20,
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20.0, ),
                    child: Row(
                      children: [
                        Image.asset(
                              AssetData.logo2,
                              width: 80,
                            ),
                            wspacing14,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Equipos\nAndean Lodges", style: TextStyle(fontSize: 25,height: 1, color: Colors.grey.shade500),),
                            Text("Cocineros", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: _buildIndicator(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: MaterialButton(
                          height: 50,
                          minWidth: 50,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onPressed: () {
                            _pageController!.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                            setState(() {
                            });
                          },
                          child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: PageView(
                  onPageChanged: (int page) {
                    setState(() {
                      currentIndex = page;
                    });
                  },
                  controller: _pageController,
                  children: <Widget>[
                    Image.network('https://andeanlodges.com/wp-content/uploads/2020/04/Esteban-Huaman-2-scaled.jpg', fit: BoxFit.cover,),
                    Image.network('https://andeanlodges.com/wp-content/uploads/2020/04/Francisco-Rojo-2-scaled.jpg', fit: BoxFit.cover,),
                    Image.network('https://andeanlodges.com/wp-content/uploads/2020/04/Juan-Carlos-Rojo-2-scaled.jpg', fit: BoxFit.cover,),
                    Image.network('https://andeanlodges.com/wp-content/uploads/2020/04/Justino-Quispe-2-scaled.jpg', fit: BoxFit.cover,),
                    Image.network('https://andeanlodges.com/wp-content/uploads/2020/04/Hernan-Huaman-2-scaled.jpg', fit: BoxFit.cover,),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }

  _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 50 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey.shade500,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i<5; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}