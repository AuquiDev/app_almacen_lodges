
import 'package:app_almacen_lodges/ui/general/navigation_barr.dart';
import 'package:app_almacen_lodges/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:concentric_transition/page_view.dart';

class InitPages extends StatefulWidget {
  const InitPages({Key? key}) : super(key: key);

  @override
  _InitPagesState createState() => _InitPagesState();
}

class _InitPagesState extends State<InitPages> {
  List<dynamic> pages = [
    {
      'image':
          'https://cdn.pixabay.com/photo/2012/04/02/12/48/movers-24402_960_720.png',
      'title': 'Transporta'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2016/03/31/19/50/checklist-1295319_960_720.png',
      'title': 'Registra'
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2012/04/02/12/49/movers-24403_960_720.png',
      'title': 'Organiza'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConcentricPageView(
      radius: 30,
      verticalPosition: 0.85,
      colors:  [
        kbrantPrimaryColor.withOpacity(.3),
        kbrantSecundaryColor.withOpacity(.6),
        kbrantTercerColor.withOpacity(.8)
      ],
      itemBuilder: (index) {
        int pageIndex = (index % pages.length);
        print(pageIndex);
        return Container(
           // margin: const EdgeInsets.all(40),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    //fit: BoxFit.fill,
                    image: NetworkImage(
              pages[pageIndex]['image'],
            ))),
            child: ButtonWidget(
              text: pages[pageIndex]["title"],
            ));
      },
    ));
  }
}

class ButtonWidget extends StatelessWidget {
  String text;

  ButtonWidget({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(  
      child: MaterialButton(
        minWidth: double.infinity,    
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NavigatorBar()));
        },
        child: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              text.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
