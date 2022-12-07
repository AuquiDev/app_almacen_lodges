import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class SeguridadWidget extends StatefulWidget {
  const SeguridadWidget({Key? key}) : super(key: key);

  @override
  _SeguridadWidgetState createState() => _SeguridadWidgetState();
}

class _SeguridadWidgetState extends State<SeguridadWidget> {
  final List<Widget> images = [
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        "https://www.elpais.com.co/files/article_main/uploads/2022/10/07/634079d3929a4.jpeg",
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        "https://i.pinimg.com/originals/00/ba/74/00ba741e28bec373bd1ccae4eea8fff4.jpg",
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        "https://catalogomedicomx.s3.amazonaws.com/produccion/img/p/2/7/1/2/5/27125-large_default.jpg",
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        "https://absequiposcontraincendios.com.pe/assets/images/extintores-pqs-co2.webp",
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        "https://http2.mlstatic.com/D_NQ_NP_920580-MLM48365269989_112021-W.jpg",
        fit: BoxFit.cover,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        "https://d5a5f8b9.rocketcdn.me/wp-content/uploads/2019/07/telefonos-satelitales.jpg",
        fit: BoxFit.cover,
      ),
    ),
  ];

  final List<String> titles = ['Botiquin', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Stack(
            children: [
              Expanded(
                child: VerticalCardPager(
                  images: images,
                  titles: titles,
                  textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  onPageChanged: (page) {},
                  onSelectedItem: (index) {
                    print(index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
