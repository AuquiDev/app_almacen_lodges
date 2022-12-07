import 'package:app_almacen_lodges/app/button%20navigator%20bar/mpvie.dart';
import 'package:app_almacen_lodges/ui/pages/cook_pages.dart';

import 'package:app_almacen_lodges/ui/pages/home_page.dart';
import 'package:app_almacen_lodges/utils/colors.dart';
import 'package:flutter/material.dart';


class NavigatorBar extends StatefulWidget {
  const NavigatorBar({ Key? key }) : super(key: key);

  @override
  _NavigatorBarState createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {

  List<Widget> tabs = [
    const HomePageLodge(),
    const CookPages(),
    const MoviesPage(),
    const Center(),
    const Center(),
  ];

  int pagesBar = 0;

  setPage(index) {
    setState(() {
      pagesBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: tabs[pagesBar],
      floatingActionButton: FloatingActionButton(
        backgroundColor: kbrantTercerColor,
        onPressed: () => setPage(4),
        child:  const Icon(Icons.app_registration, color:Colors.white, size: 35,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,//centra el el button floating
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: pagesBar == 0 ? Colors.white :
                Colors.grey, size: 30,),
                onPressed: () => setPage(0),
              ),
              IconButton(
                icon: Icon(Icons.search, color: pagesBar == 0 ? Colors.white :
                Colors.grey, size: 30,),
                onPressed: () => setPage(1),
              ),
              const SizedBox.shrink(),
              IconButton(
                icon: Icon(Icons.person, color: pagesBar == 0 ? Colors.white :
                Colors.grey, size: 30,),
                onPressed: () => setPage(2),
              ),
              IconButton(
                icon: Icon(Icons.notifications_outlined, color: pagesBar == 0 ? Colors.white :
                Colors.grey, size: 30,),
                onPressed: () => setPage(3),
              )
            ],
          )
        )
      ),
    );
  }
}